import 'package:flutter_examination/data/repositories/movie_repository.dart';
import 'package:flutter_examination/view_models/movie_detail_view_model.dart';
import 'package:flutter_examination/view_models/movie_view_model.dart';
import 'package:provider/provider.dart';

final _movieViewModelProvider = ChangeNotifierProvider<MovieViewModel>(
  create: (context) => MovieViewModel(context.read<MovieRepository>()),
);

final _movieDetailViewModelProvider = ChangeNotifierProvider<MovieDetailViewModel>(
  create: (context) => MovieDetailViewModel(context.read<MovieRepository>()),
);

final viewModelProviders = [
  _movieViewModelProvider,
  _movieDetailViewModelProvider,
];
