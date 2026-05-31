part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {
  final int value;

  CounterIncrementEvent({required this.value});
}

class CounterDecrementEvent extends CounterEvent {
  final int value;

  CounterDecrementEvent({required this.value});
}
