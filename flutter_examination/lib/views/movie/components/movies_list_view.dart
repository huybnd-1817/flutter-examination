import 'package:flutter/material.dart';
import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';
import 'package:flutter_examination/view_models/movie_detail_view_model.dart';
import 'package:flutter_examination/view_models/movie_view_model.dart';
import 'package:flutter_examination/views/movie/components/movie_cell.dart';
import 'package:provider/src/provider.dart';

class MoviesListView extends StatelessWidget {
  final Future<void> Function() refreshCallback;
  final ScrollController scrollController;
  final Function(MovieInfoDataModel) tapCallback;

  const MoviesListView({
    Key? key,
    required this.refreshCallback,
    required this.scrollController,
    required this.tapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieViewModel>().movies;
    return movies.isNotEmpty
        ? RefreshIndicator(
            onRefresh: refreshCallback,
            child: listView(context, movies),
          )
        : const Center(child: Text('No items'));
  }

  Widget listView(BuildContext context, List<MovieDataModel> movies) {
    return ListView.builder(
      controller: scrollController,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = movies[index];
        if (index == movies.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return GestureDetector(
            onTap: () async {
              if (movie.id != null) {
                await Provider.of<MovieDetailViewModel>(context, listen: false)
                    .getMovieInfo(movie.id!);
                var movieInfo = context.read<MovieDetailViewModel>().movieInfo;
                if (movieInfo != null) {
                  tapCallback(movieInfo);
                }
              }
            },
            child: MovieCell(movie));
      },
    );
  }
}
