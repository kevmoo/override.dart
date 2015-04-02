// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library injection_fun_test;

import 'package:injection_fun/time_utils.dart';
import 'package:injection_fun/package_providers.dart';

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
