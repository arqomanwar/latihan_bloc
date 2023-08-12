import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter({this.init = 0}) : super(init);

  int init;
  int? current;
  int? next;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
