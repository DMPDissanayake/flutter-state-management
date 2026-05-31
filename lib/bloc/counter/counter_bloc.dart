import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementEvent) {
        int value = event.value;
        value++;
        emit(CounterIncounterState(value: value));
      } else if (event is CounterDecrementEvent) {
        int value = event.value;
        value--;
        emit(CounterDecrementState(value: value));
      }
    });
  }
}
