import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examination/custom_views/custom_button.dart';
import 'package:flutter_examination/custom_views/draw_triangle.dart';
import 'package:flutter_examination/data/models/movie_info_data_model.dart';
import 'package:flutter_examination/data/remote/movie_api.dart';
import 'package:flutter_examination/helpers/assets_factory.dart';
import 'package:flutter_examination/helpers/device_helper.dart';
import 'package:flutter_examination/views/movie_detail/components/movie_info_view.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieInfoDataModel movieInfo;
  final double _backdropImageHeight = DeviceHelper.blockSize * 25;
  final double _backdropImageWidth = DeviceHelper.screenWidth;
  final double _posterImageHeight = DeviceHelper.blockSize * 18;
  final double _posterImageWidth = DeviceHelper.blockSize * 12;
  final double _ratingViewHeight = 28.0;

  MovieDetailPage(this.movieInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Movie Detail",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          headerView(),
          titleView(),
          const Divider(thickness: 2, height: 0),
          reviewsAndTrailersView(),
          const Divider(thickness: 2, height: 0),
          additionInfoView(),
          const Divider(thickness: 2, height: 0),
          descriptionView(),
        ],
      ),
    );
  }

  Widget headerView() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        backdropImageView(),
        CustomPaint(
            size: Size(DeviceHelper.screenWidth, DeviceHelper.blockSize * 8),
            painter: DrawTriangle()),
        posterImageView(),
      ],
    );
  }

  Widget backdropImageView() {
    return CachedNetworkImage(
      height: _backdropImageHeight,
      width: _backdropImageWidth,
      fit: BoxFit.fitWidth,
      placeholderFadeInDuration: const Duration(seconds: 1),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      imageUrl: '$imageApi${movieInfo.backdropPath}',
    );
  }

  Widget posterImageView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: CachedNetworkImage(
        height: _posterImageHeight,
        width: _posterImageWidth,
        fit: BoxFit.fitWidth,
        placeholderFadeInDuration: const Duration(seconds: 1),
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        imageUrl: '$imageApi${movieInfo.posterPath}',
      ),
    );
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(children: <Widget>[
        SizedBox(
          width: DeviceHelper.screenWidth - 32.0 - _ratingViewHeight,
          child: Text(
            movieInfo.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            maxLines: 2,
          ),
        ),
        const Spacer(),
        ratingView(),
      ]),
    );
  }

  Widget ratingView() {
    return SizedBox(
      height: _ratingViewHeight,
      width: _ratingViewHeight,
      child: Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              value: (movieInfo.voteAverage ?? 0) / 10,
              backgroundColor: const Color.fromRGBO(231, 231, 231, 1.0),
              color: Colors.black,
              strokeWidth: 4,
            ),
          ),
          Center(
              child: Text(
            (movieInfo.voteAverage ?? 0).toString(),
            style: const TextStyle(fontSize: 10),
          ))
        ],
      ),
    );
  }

  Widget reviewsAndTrailersView() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CustomButton(
              title: "Reviews",
              iconName: AssetsFactory.starIcon,
              iconHeight: DeviceHelper.blockSize * 2.3),
          const VerticalDivider(thickness: 1, width: 0),
          CustomButton(
              title: "Trailers",
              iconName: AssetsFactory.playIcon,
              iconHeight: DeviceHelper.blockSize * 2.3),
        ],
      ),
    );
  }

  Widget additionInfoView() {
    var genres = movieInfo.genres?.map((e) => e.name);
    var releaseDate = movieInfo.releaseDate ?? '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MovieInfoView(category: "Genre", info: genres?.join(', ') ?? ''),
        MovieInfoView(category: "Release", info: releaseDate),
      ],
    );
  }

  Widget descriptionView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        movieInfo.overview ?? '',
        style: const TextStyle(fontSize: 12),
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
      ),
    );
  }
}
