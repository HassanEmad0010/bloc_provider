import 'package:bloc_provider/Cubit/Counter_Cubit.dart';
import 'package:bloc_provider/Cubit/Counter_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  int num_value = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state is IncrementCounter) {
          num_value = BlocProvider.of<CounterCubit>(context).number;
        } else if (state is DecrementCounter) {
          num_value = BlocProvider.of<CounterCubit>(context).number;
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text("Counting..."),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .numberCounterMethod(num: 1, inc_decr: "I");
                      },
                      color: Colors.blueAccent,
                      child: const Icon(Icons.add)),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context)
                            .numberCounterMethod(num: 1, inc_decr: "D");
                      },
                      color: Colors.teal,
                      child: const Icon(Icons.remove)),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                ' this many times:',
              ),
              Text(
                '${BlocProvider.of<CounterCubit>(context).number}',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
