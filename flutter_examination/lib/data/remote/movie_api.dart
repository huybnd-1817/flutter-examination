import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';

const String apiKey = 'f19c9579550cab23f3c9abdfeff7cc35';
const String imageApi = 'https://image.tmdb.org/t/p/w185';

abstract class MovieApi {
  Future<PopularMovies> fetchPopularMovies(int page);
  Future<MovieInfoDataModel> getMovieInfo(int movieId);
}