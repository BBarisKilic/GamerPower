import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/data_model.dart';
import '../repos/games_repo.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GamesRepo gamesRepo;
  late List<DataModel>? _apiResult;

  GameDataBloc(this.gamesRepo) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      switch (event.runtimeType) {
        case LoadGameDataEvent:
          emit(GameDataLoadingState());
          _apiResult = await gamesRepo.getGames();
          await Future.delayed(const Duration(seconds: 1), () {});

          if (_apiResult == null) {
            emit(GameDataErrorState());
          } else {
            emit(GameDataLoadedState(apiResult: _apiResult!));
          }

          break;
        default:
          emit(GameDataInitialState());
          break;
      }
    });
  }
}
