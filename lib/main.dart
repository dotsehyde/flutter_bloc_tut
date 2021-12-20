import 'package:bloc_tut/bloc/provider/cubit/theme_cubit.dart';
import 'package:bloc_tut/views/home.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())],
      child: BlocWidget(),
    );
  }
}

class BlocWidget extends StatelessWidget {
  const BlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = BlocProvider.of<ThemeCubit>(context, listen: true).isDark;
    return MaterialApp(
      title: 'Bloc Tutorial',
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: const Home(),
    );
  }
}
