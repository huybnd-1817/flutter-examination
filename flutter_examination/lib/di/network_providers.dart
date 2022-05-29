import 'package:flutter_examination/data/remote/movie_api.dart';
import 'package:flutter_examination/data/remote/movie_api_impl.dart';
import 'package:provider/provider.dart';

final _movieApi = Provider<MovieApi>(create: (context) => MovieApiImpl());
final networkProviders = [_movieApi];