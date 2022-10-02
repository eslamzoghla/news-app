import 'package:first_project/modules/counter/cubit/cubit.dart';
import 'package:first_project/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  static const String routeName = 'Counter';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // must create Cubic <It's a type of Bloc>
      create: (BuildContext context) => CounterCubit(),

      // Bloc Consumer needed Cubit and States
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            body: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).Minus();
                      },
                      child: Text(
                        'MINUS',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        CounterCubit.get(context).Plus();
                      },
                      child: Text(
                        'PLUS',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
