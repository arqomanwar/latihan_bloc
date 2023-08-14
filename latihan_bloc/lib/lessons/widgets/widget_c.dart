import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class WidgetC extends StatelessWidget {
  const WidgetC({super.key, required this.myCounter});

  final Counter myCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      padding: const EdgeInsets.all(10),
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.lightBlue,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Widget C",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              color: Colors.lightBlue,
              child: BlocBuilder(
                bloc: myCounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
