import 'package:bloc_practise_app/bloc/counter_bloc.dart';
import 'package:bloc_practise_app/bloc/counter_page.dart';
import 'package:bloc_practise_app/feature/car_app/car_view/car_screen.dart';
import 'package:bloc_practise_app/feature/car_app/cubit/car_cubit.dart';
import 'package:bloc_practise_app/screen/counter_app/coun_app.dart';
import 'package:bloc_practise_app/screen/counter_app/count/count_bloc.dart';
import 'package:bloc_practise_app/screen/counter_app/like/like_bloc.dart';
import 'package:bloc_practise_app/screen/cubit/list_cubit.dart';
import 'package:bloc_practise_app/screen/view/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=> CountBloc()),
        BlocProvider(create: (context)=> LikeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountApp(),
      ),
    );
  }
}


