import 'package:bloc_practise_app/screen/counter_app/count/count_bloc.dart';
import 'package:bloc_practise_app/screen/counter_app/like/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: BlocBuilder<CountBloc, CountState>(
                builder: (context, state) {
                  return Text(
                    'count: ${state.count}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  );
                }),
          ),
          BlocBuilder<LikeBloc, LikeState>(builder: (context, state) {
            return IconButton(onPressed: () => context.read<LikeBloc>().add(Like()),
                icon: state.like ? const Icon(
                  Icons.favorite, color: Colors.red,):const Icon(
                  Icons.favorite_border, color: Colors.grey,) ) ;
          })
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CountBloc>().add(MinusEvent()),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CountBloc>().add(PlusEvent()),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
