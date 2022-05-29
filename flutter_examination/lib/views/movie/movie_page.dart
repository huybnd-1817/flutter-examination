import 'package:flutter/material.dart';
import 'package:flutter_examination/helpers/device_helper.dart';
import 'package:flutter_examination/view_models/movie_view_model.dart';
import 'package:flutter_examination/views/movie/components/movies_list_view.dart';
import 'package:flutter_examination/views/movie_detail/movie_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late final ScrollController scrollController = ScrollController()..addListener(_scrollListener);

  @override
  void initState() {
    super.initState();
    Provider.of<MovieViewModel>(context, listen: false).fetchPopularMovies();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceHelper().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: MoviesListView(
        refreshCallback: _refresh,
        scrollController: scrollController,
        tapCallback: (movieInfo) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movieInfo),
              ));
        },
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        "Popular",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      Provider.of<MovieViewModel>(context, listen: false).loadMore();
    }
  }

  Future<void> _refresh() async {
    await Provider.of<MovieViewModel>(context, listen: false).fetchPopularMovies();
  }
}
