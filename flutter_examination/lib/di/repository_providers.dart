import 'package:flutter_examination/data/remote/movie_api.dart';
import 'package:flutter_examination/data/repositories/movie_repository.dart';
import 'package:flutter_examination/data/repositories/movie_repository_impl.dart';
import 'package:provider/provider.dart';

final _movieRepository = Provider<MovieRepository>(
  create: (context) => MovieRepositoryImpl(movieApi: context.read<MovieApi>()),
);
final repositoryProviders = [_movieRepository];
