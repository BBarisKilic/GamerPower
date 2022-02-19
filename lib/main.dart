import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_page.dart';

import 'bloc/game_data_bloc.dart';
import 'repos/games_repo.dart';

void main() {
  runApp(BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(GamesRepo()),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamerPower',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
