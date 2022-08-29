import 'package:flutter_bloc/flutter_bloc.dart';

import 'Counter_State.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(IncrementCounter());

  int number = 0;

  void numberCounterMethod({required int num, required String inc_decr}) {
    if (inc_decr == 'I') {
      number += num;
      emit(IncrementCounter());
    } else if (inc_decr == "D") {
      number -= num;
      emit(DecrementCounter());
    } else {}
  }
}
