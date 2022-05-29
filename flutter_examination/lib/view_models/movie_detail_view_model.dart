import 'package:flutter/material.dart';
import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/repositories/movie_repository.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final MovieRepository movieRepository;
  MovieInfoDataModel? _movieInfo;

  MovieInfoDataModel? get movieInfo => _movieInfo;

  MovieDetailViewModel(this.movieRepository);

  getMovieInfo(int movieId) async {
    _movieInfo = await movieRepository.getMovieInfo(movieId);
    notifyListeners();
  }
}
