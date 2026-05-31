part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterIncounterState extends CounterState {
  final int value;

  CounterIncounterState({required this.value});
}

class CounterDecrementState extends CounterState {
  final int value;

  CounterDecrementState({required this.value});
}
