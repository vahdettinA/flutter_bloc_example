import 'package:bloc_example/state_managment/counterBloc/counter_bloc.dart';
import 'package:bloc_example/state_managment/counterBloc/counter_event.dart';
import 'package:bloc_example/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin HomePageViewModel on State<HomePage> {
  void addCount() {
    context.read<CounterBloc>().update(CounterEvent.add);
  }

  void removeCount() {
    context.read<CounterBloc>().update(CounterEvent.remove);
  }
}
