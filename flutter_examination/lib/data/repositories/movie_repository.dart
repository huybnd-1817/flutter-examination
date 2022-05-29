import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';

abstract class MovieRepository {
  Future<List<MovieDataModel>> fetchPopularMovies({int page});
  Future<MovieInfoDataModel?> getMovieInfo(int movieId);
}
