library injection_fun_test;

import 'package:override/time_utils.dart';
import 'package:override/package_providers.dart';

import 'package:unittest/unittest.dart';

import 'src/mock_clock.dart';

void main() {
  clockProvider.overrideValue(new RelativeClock(initialTime: _9am));

  // some crazy thing to override the clock instance thing, right?

  test('use mock clock', () {
    expect(timeSinceMidnight, const Duration(hours: 9));
  });
}

final _9am = (() {
  var now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day, 9);
})();
