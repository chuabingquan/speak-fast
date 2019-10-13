import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/text_content.dart';
import '../widgets/countdown.dart';
import '../widgets/play_button.dart';
import './complete_screen.dart';

import '../data.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Timer _timer;
  bool _startGame = false;
  int _countdown = 15;
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String _resultText = "";
  CameraController _cameraController;
  String _videoPath;
  List<CameraDescription> _cameras;
  int _selectedCameraId;

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
    initCameras();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
        (result) => setState(() => _isAvailable = true));
    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));
    _speechRecognition.setRecognitionResultHandler(
        (speech) => setState(() => _resultText = speech));
    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));
    _speechRecognition
        .activate()
        .then((result) => setState(() => _isAvailable = result));
  }

  void initCameras() {
    availableCameras().then((availableCameras) {
      _cameras = availableCameras;

      if (_cameras.length > 0) {
        setState(() {
          _selectedCameraId = 1;
        });

        _onCameraSwitched(_cameras[_selectedCameraId]).then((void v) {});
      }
    }).catchError((err) {
      print('$err');
    });
  }

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (_cameraController != null) await _cameraController.dispose();

    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    _cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    try {
      await _cameraController.initialize();
    } on CameraException catch (err) {
      print('$err');
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _startVideoRecording() async {
    if (!_cameraController.value.isInitialized) return null;
    if (_cameraController.value.isRecordingVideo) return null;

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/$currentTime.mp4';

    try {
      await _cameraController.startVideoRecording(filePath);
      _videoPath = filePath;
    } on CameraException catch (err) {
      print('START: $err');
      throw err;
      // return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!_cameraController.value.isRecordingVideo) return null;

    try {
      await _cameraController.stopVideoRecording();
    } on CameraException catch (err) {
      print('STOP: $err');
      throw err;
      // return null;
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speechRecognition.stop().then((result) {
        setState(() {
          _isListening = result;
          _startGame = false;
        });
        String userTranscript = "" + _resultText;
        _resultText = "";
        Navigator.of(context).pushReplacementNamed(CompleteScreen.routeName,
            arguments: {'reading': READINGS[0], 'transcript': userTranscript});
      });
    }
  }

  void startTimer(Function next) {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSecond,
        (Timer timer) => setState(() {
              if (_countdown < 1) {
                timer.cancel();
                // _stopVideoRecording().then((_) {
                //   if (mounted) setState(() {});
                // });
                next();
              } else _countdown -= 1;
              // else if (_countdown == 4) {
              //   _startVideoRecording().then((filePath) {});
              // }
            }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "speak",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                // fontStyle: FontStyle.italic,
                fontSize: 23,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              "fast",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 23,
                letterSpacing: 3,
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextContent(READINGS[0]),
            Countdown(_countdown),
            _startGame
                ? SizedBox(
                    height: 25,
                  )
                : PlayButton(() {
                    setState(() {
                      _startGame = true;
                    });
                    startTimer(_stopListening);
                    if (_isAvailable && !_isListening) {
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                    }
                  }),
          ],
        ),
      ),
    );
  }
}
