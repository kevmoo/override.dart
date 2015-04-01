import 'things_manager.dart';

Duration get timeSinceMidnight {
  var now = clockProvider.value.now;
  return new Duration(
      hours: now.hour, minutes: now.minute, seconds: now.second);
}

int get secondsSinceMidnight => timeSinceMidnight.inSeconds;
