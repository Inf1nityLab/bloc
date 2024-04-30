import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<PlusEvent>((event, emit) {
      emit(CounterState(count: state.count +1));
    });
    on<MinusEvent>((event, emit) {
      emit(CounterState(count: state.count -1));
    });
  }
}


