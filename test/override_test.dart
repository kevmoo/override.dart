library injection_fun_test;

import 'package:override/override.dart' as or;
import 'package:override/example/time_utils.dart';
import 'package:override/example/package_providers.dart';

import 'package:unittest/unittest.dart';

import 'src/mock_clock.dart';

void main() {
  if (!or.allowOverride) {
    throw 'You must run this test with "-Dallow-override=true" passed to '
        'dart2js or dart';
  }

  var now = new DateTime.now();
  var dummyTime = new DateTime(now.year, now.month, now.day, 9);

  clockProvider.overrideValue(new RelativeClock(initialTime: dummyTime));

  test('Test `timeSinceMidnight` correctly calculates the time since midnight.',
      () {
    // Use `timeSinceMidnight`, but with an overridden implementation of
    // `Clock`.
    expect(timeSinceMidnight, const Duration(hours: 9));
  });
}
