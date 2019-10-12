class Reading {
  final String _content;
  final int _timeLimit;

  const Reading(this._content, this._timeLimit);

  String get content {
    return _content;
  }

  int get timeLimit {
    return _timeLimit;
  }
}