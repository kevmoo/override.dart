library package_providers;

import 'package:override/override.dart';

import 'clock.dart';

/// Provides a `Clock` value for any user.
///
/// Can be overriden if `allow-override` Dart environment is set to `true`
/// with the `dart` command or `dart2js`.
final Provider<Clock> clockProvider = new Provider<Clock>(const Clock());
