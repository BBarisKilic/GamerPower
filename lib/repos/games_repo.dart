import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_model.dart';

class GamesRepo {
  late final String _url;
  late final http.Response _result;
  late final Iterable _models;
  late final List<DataModel> _dataModels;
  late DataModel _dataModel;

  GamesRepo() {
    _url = 'https://www.gamerpower.com/api/giveaways';
    _dataModels = <DataModel>[];
  }

  Future<List<DataModel>?> getGames() async {
    _result = await http.Client().get(Uri.parse(_url));
    _dataModels.clear();

    if (_result.statusCode == 200) {
      return null;
    } else {
      _models = jsonDecode(_result.body);

      for (var model in _models) {
        _dataModel = DataModel.fromJson(model);
        _dataModels.add(_dataModel);
      }

      return _dataModels;
    }
  }
}
