import 'final_provider.dart';

const bool allowOverride =
    const bool.fromEnvironment('allow-override', defaultValue: false);

class Provider<T> {
  bool _valueSet = false;
  T _value;

  factory Provider(T value) {
    if (allowOverride) {
      return new Provider._(value);
    }
    return new FinalProvider(value);
  }

  Provider._(T value) : this._value = value;

  T get value {
    if (!_valueSet) {
      _valueSet = true;
    }
    return _value;
  }

  void overrideValue(T value) {
    if (_valueSet) {
      throw new Exception('Cannot override once a value has been accessed.');
    }

    _value = value;
    _valueSet = true;
  }
}
