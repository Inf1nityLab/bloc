part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class PlusEvent extends CounterEvent{}

class MinusEvent extends CounterEvent{}
