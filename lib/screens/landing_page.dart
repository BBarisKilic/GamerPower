import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamer_power/bloc/game_data_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case GameDataInitialState:
              context.read<GameDataBloc>().add(LoadGameDataEvent());
              return const SizedBox();
            case GameDataLoadingState:
              return const CircularProgressIndicator.adaptive();
            case GameDataLoadedState:
              return const Center(child: Text('Successfuly Loaded.'));
            case GameDataErrorState:
              return const Center(child: Text('Error.'));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
