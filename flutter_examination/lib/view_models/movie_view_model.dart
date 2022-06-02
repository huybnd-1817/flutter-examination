import 'package:flutter/material.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';
import 'package:flutter_examination/data/repositories/movie_repository.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieRepository movieRepository;
  List<MovieDataModel> _movies = [];
  List<MovieDataModel> get movies => _movies;
  int _page = 1;

  MovieViewModel(this.movieRepository);

  fetchPopularMovies() async {
      _movies = await movieRepository.fetchPopularMovies();
      notifyListeners();
  }

  loadMore() async {
    _page += 1;
    var newMovies = await movieRepository.fetchPopularMovies(page: _page);
    _movies.addAll(newMovies);
    notifyListeners();
  }
}