import 'package:bloc_tut/bloc/provider/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = "Change to light";
  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Bloc"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<ThemeCubit, ThemeState>(
                listener: (context, state) {
                  if (state is ThemeLight) {
                    text = "Change to dark";
                  } else {
                    text = "Change to light";
                  }
                },
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      child: Text(text),
                      onPressed: () {
                        theme.toggleTheme();
                      },
                    );
                  },
                ),
              ),
              Text("World"),
            ],
          ),
        ));
  }
}
