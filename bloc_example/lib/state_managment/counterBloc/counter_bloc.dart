import 'package:bloc_example/state_managment/counterBloc/counter.dart';
import 'package:bloc_example/state_managment/counterBloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0));
  update(CounterEvent event) {
    switch (event) {
      case CounterEvent.add:
        state.count++;

        // ignore: invalid_use_of_visible_for_testing_member
        emit(CounterState(count: state.count));

        break;
      case CounterEvent.remove:
        state.count--;
        // ignore: invalid_use_of_visible_for_testing_member
        emit(CounterState(count: state.count));

        break;
    }
  }
}
