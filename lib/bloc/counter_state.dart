part of 'counter_bloc.dart';


class CounterState {
  final int counter;

  const CounterState({this.counter = 0}); // Initial state is 0

  // Using 'equatable' for easier state comparison
  @override
  List<Object> get props => [counter];
}