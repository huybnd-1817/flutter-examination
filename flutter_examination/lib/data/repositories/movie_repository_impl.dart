import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';
import 'package:flutter_examination/data/remote/movie_api.dart';
import 'package:flutter_examination/data/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieApi movieApi;

  MovieRepositoryImpl({required this.movieApi});

  @override
  Future<List<MovieDataModel>> fetchPopularMovies({int page = 1}) async {
    try {
      final response = await movieApi.fetchPopularMovies(page);
      final List<MovieDataModel> movies = List.of(response.movies ?? []);
      return movies;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<MovieInfoDataModel?> getMovieInfo(int movieId) async {
    try {
      return await movieApi.getMovieInfo(movieId);
    } catch (e) {
      return null;
    }
  }
}