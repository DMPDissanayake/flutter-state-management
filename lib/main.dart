import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/bloc/counter/counter_bloc.dart';
import 'package:test_bloc/injection.dart';

void main() {
  setupInjection();
  runApp(const MyApp());
}

void setupInjection() {
  registerSingleton<CounterBloc>(CounterBloc());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: BlocProvider<CounterBloc>.value(
          value: injection<CounterBloc>(),
          child: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final counterBloc = injection<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is CounterIncounterState) {
            _counter = state.value;
            setState(() {});
          } else if (state is CounterDecrementState) {
            _counter = state.value;
            setState(() {});
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              SizedBox(height: 10.h),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment_btn',
            onPressed: () {
              counterBloc.add(CounterIncrementEvent(value: _counter));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            heroTag: 'decrement_btn',
            onPressed: () {
              counterBloc.add(CounterDecrementEvent(value: _counter));
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
