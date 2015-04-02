import 'package:override/example/clock.dart';

import 'fake_stopwatch.dart';

typedef Duration _Elapsed();

class RelativeClock implements Clock {
  final DateTime _initialTime;
  final _Elapsed _elapsed;
  final int _frequency;

  RelativeClock(
      {DateTime initialTime, Duration elapsed(), int frequency: 1000000})
      : _initialTime = initialTime == null ? new DateTime.now() : initialTime,
        _elapsed = elapsed == null ? (() => Duration.ZERO) : elapsed,
        _frequency = frequency;

  @override
  DateTime get now => _initialTime.add(_elapsed());

  @override
  Stopwatch getStopwatch() => new FakeStopwatch(
      () => _elapsed().inMicroseconds * _frequency ~/ 1000000, _frequency);
}
