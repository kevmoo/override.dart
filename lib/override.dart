library override;

const String _allowOverrideFlag = 'allow-override';

const bool allowOverride =
    const bool.fromEnvironment(_allowOverrideFlag, defaultValue: false);

abstract class Provider<T> {
  factory Provider(T value) {
    if (allowOverride) {
      return new _ProviderImpl<T>(value);
    }
    return new _FinalProvider<T>(value);
  }

  T get value;

  void overrideValue(T value);
}

class _ProviderImpl<T> implements Provider<T> {
  bool _valueSet = false;
  T _value;

  _ProviderImpl(T value) : this._value = value;

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

class _FinalProvider<T> implements Provider<T> {
  final T value;

  _FinalProvider(this.value);

  void overrideValue(T value) {
    throw new UnsupportedError('Cannot override this implementation.'
        ' You must set the "$_allowOverrideFlag" Dart environment variable to'
        ' the dart runtime or dart compiler via "-D${_allowOverrideFlag}=true');
  }
}
