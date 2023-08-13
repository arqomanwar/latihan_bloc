import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';
import 'package:flutter/material.dart';

class BlocConsumerPage extends StatelessWidget {
  BlocConsumerPage({super.key});

  final Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Consumer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 50),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("TAMPILKAN $state GENAP"),
                duration: const Duration(seconds: 1),
              ));
            },
            buildWhen: (previous, current) {
              if (current >= 10) {
                return true;
              } else {
                return false;
              }
            },
            listenWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              } else {
                return false;
              }
            },
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: myCounter.increment,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
