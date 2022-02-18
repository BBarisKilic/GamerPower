// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required int id,
    required String title,
    required String worth,
    required String thumbnail,
    required String image,
    required String description,
    required String instructions,
    required String open_giveaway_url,
    required String published_date,
    required String type,
    required String platforms,
    required String end_date,
    required int users,
    required String status,
    required String gamerpower_url,
    required String open_giveaway,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
