import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamer_power/bloc/game_data_bloc.dart';
import 'package:gamer_power/models/data_model.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const SizedBox();
          } else if (state is GameDataLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GameDataLoadedState) {
            return _buildGameModel(state.apiResult);
          } else if (state is GameDataErrorState) {
            return const Center(child: Text('Error.'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildGameModel(List<DataModel> apiResult) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final DataModel dataModel = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            onTap: () {
              // context.router.push(DetailsRoute(dataModel: dataModel));
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: 230,
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.cover,
                      image: NetworkImage(dataModel.image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width / 1.05,
                      height: 120,
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                dataModel.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Platforms: " + dataModel.platforms,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
