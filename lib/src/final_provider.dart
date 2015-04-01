import 'provider.dart';

class FinalProvider<T> implements Provider<T> {
  final T value;

  FinalProvider(this.value);

  void overrideValue(T value) {
    throw new UnsupportedError('Cannot override this impl');
  }
}
