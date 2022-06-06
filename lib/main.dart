import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/counter_bloc.dart';
import 'package:test/services.dart';

void main() {
  runApp(
    const MyApp(),
  );
  getRequest();
}

final List<String> data = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
              child: (data.isEmpty)
                  ? const Text("NO Data found")
                  : Text(data[state.count]));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.large(
            onPressed: () {
              context.read<CounterBloc>().add(CounterEvent.increment());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton.large(
              onPressed: () {
                context.read<CounterBloc>().add(
                      CounterEvent.decrement(),
                    );
              },
              child: Icon(Icons.remove))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
