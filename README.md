### Thoughts on allowing efficient overriding of helpers in tests - EXPERIMENTAL

## Scenario.

* You an application to use a since `Clock` instance to get the current time, etc.
* You want to provide a "mock" of `Clock` in certain tests to validate related code.

## Goals

* The mocking solution should have minimal runtime override in production.
* Do something leveraging existing Dart language and runtime features.
* Make it hard (impossible?) to swap out the mock in a production app.

## Solution

* Expose top-level "provider" fields that give access to the desired object
  with the production value pre-defined.

```dart
// See lib/example/package_providers.dart
import 'package:override/override.dart';
import 'clock.dart';

final Provider<Clock> clockProvider = new Provider<Clock>(const Clock());
``` 

* Use the provider to access the desired value anywhere/everywhere in your code.

```dart
// See 'lib/example/time_utils.dart'
import 'package_providers.dart';

Duration get timeSinceMidnight {
  var now = clockProvider.value.now;
  return new Duration(
      hours: now.hour, minutes: now.minute, seconds: now.second);
}

int get secondsSinceMidnight => timeSinceMidnight.inSeconds;
```

* Override the value in your test code.

```dart
// See test/override_test.dart

clockProvider.overrideValue(new RelativeClock(initialTime: dummyTime));

test('Test `timeSinceMidnight` correctly calculates the time since midnight.', () {
  // Use `timeSinceMidnight`, but with an overridden implementation of
  // `Clock`.
  expect(timeSinceMidnight, const Duration(hours: 9));
});
```