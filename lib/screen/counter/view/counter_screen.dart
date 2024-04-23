import 'package:bloc_practise_app/screen/counter/cubit/bukva_cubit.dart';
import 'package:bloc_practise_app/screen/counter/cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import 'counter_view.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CounterCubit(),

      ),
      BlocProvider(
        create: (context) => LikeCubit(),

      ),

      BlocProvider(create: (context) => BukvaCubit())
    ], child: const CounterView());
  }
}
