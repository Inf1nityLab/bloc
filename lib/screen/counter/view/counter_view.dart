import 'package:bloc_practise_app/screen/counter/cubit/bukva_cubit.dart';
import 'package:bloc_practise_app/screen/counter/cubit/counter_cubit.dart';
import 'package:bloc_practise_app/screen/counter/cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    bool a = true;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 30),
                );
              }),
            ),
            BlocBuilder<LikeCubit, bool>(builder: (context, state) {
              return IconButton(
                  onPressed: () => context.read<LikeCubit>().like(),
                  icon: state
                      ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                      : const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ));
            }),
            BlocBuilder<BukvaCubit, String>(builder: (context, state) {
              return Text(state, style: const TextStyle(fontSize: 40),);

            }),
            Row(children: [
              TextButton(onPressed: () => context.read<BukvaCubit>().lower(),
                  child: const Text('low')),
              TextButton(onPressed: () => context.read<BukvaCubit>().upper(),
                  child: const Text('upper'))
            ],),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().increment(),
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterCubit>().decrement(),
            ),
          ],
        ));
  }
}
