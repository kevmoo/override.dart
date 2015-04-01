// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library injection_fun_test;

import 'package:injection_fun/some_code.dart';

import 'package:unittest/unittest.dart';

void main() {
  // some crazy thing to override the clock instance thing, right?

  test('use mock clock', () {
    expect(timeSinceMidnight, const Duration(hours: 9));
  });
}
