import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies.freezed.dart';

part 'popular_movies.g.dart';

@freezed
class PopularMovies with _$PopularMovies {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PopularMovies(
      {int? page,
      @JsonKey(name: 'results') List<MovieDataModel>? movies,
      int? totalPages,
      int? totalResults}) = _PopularMovies;

  factory PopularMovies.fromJson(Map<String, dynamic> json) => _$PopularMoviesFromJson(json);
}

@freezed
class MovieDataModel with _$MovieDataModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieDataModel({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _Results;

  factory MovieDataModel.fromJson(Map<String, dynamic> json) => _$MovieDataModelFromJson(json);
}
