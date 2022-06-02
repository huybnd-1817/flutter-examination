import 'package:flutter/material.dart';
import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';
import 'package:flutter_examination/data/remote/movie_api.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MovieApiImpl extends MovieApi {
  @override
  Future<PopularMovies> fetchPopularMovies(int page) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=$page'));

      if (response.statusCode == 200) {
        return PopularMovies.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch popular movies');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to fetch popular movies');
    }
  }

  @override
  Future<MovieInfoDataModel> getMovieInfo(int movieId) async {
    try {
      final response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey&language=en-US'));
      if (response.statusCode == 200) {
        return MovieInfoDataModel.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('Failed to get movie detail');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to get movie detail');
    }
  }
}
