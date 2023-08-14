import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class WidgetB extends StatelessWidget {
  const WidgetB({super.key, required this.myCounter});

  final Counter myCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.orangeAccent,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.blueAccent,
            child: const Text(
              "Widget B",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: myCounter.decrement,
                child: const Icon(Icons.remove),
              ),
              Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  child: BlocBuilder(
                    bloc: myCounter,
                    builder: (context, state) {
                      return Text(
                        "$state",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      );
                    },
                  )),
              ElevatedButton(
                onPressed: myCounter.increment,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
