import 'package:bloc_example/state_managment/counterBloc/counter.dart';
import 'package:bloc_example/state_managment/counterBloc/counter_bloc.dart';
import 'package:bloc_example/viewmodel/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => addCount(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => removeCount(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Text(state.count.toString());
        },
      )),
    );
  }
}
