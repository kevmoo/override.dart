library clock;

class Clock {
  const Clock();

  DateTime get now => new DateTime.now();

  Stopwatch getStopwatch() => new Stopwatch();
}
