import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_info_data_model.freezed.dart';

part 'movie_info_data_model.g.dart';

@freezed
class MovieInfoDataModel with _$MovieInfoDataModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieInfoDataModel(
      {bool? adult,
      String? backdropPath,
      int? budget,
      List<Genres>? genres,
      String? homepage,
      int? id,
      String? imdbId,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      int? revenue,
      int? runtime,
      String? status,
      String? tagline,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount}) = _MovieInfoDataModel;

  factory MovieInfoDataModel.fromJson(Map<String, dynamic> json) =>
      _$MovieInfoDataModelFromJson(json);
}

@freezed
class Genres with _$Genres {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Genres({
    int? id,
    String? name,
  }) = _Genres;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}
