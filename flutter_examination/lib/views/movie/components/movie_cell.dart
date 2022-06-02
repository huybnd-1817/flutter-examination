import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examination/data/models/popular_movies.dart';
import 'package:flutter_examination/data/remote/movie_api.dart';
import 'package:flutter_examination/helpers/device_helper.dart';

class MovieCell extends StatelessWidget {
  final MovieDataModel movie;
  final double cellHPadding = 16.0;
  final double cellVPadding = 8.0;
  final double spacing = 12.0;
  final double imageHeight = DeviceHelper.blockSize * 13;
  final double imageWidth = DeviceHelper.blockSize * 10;

  MovieCell(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cellHPadding, vertical: cellVPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          posterImageView(),
          SizedBox(width: spacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleView(),
              const SizedBox(height: 4),
              descriptionView(),
            ],
          )
        ],
      ),
    );
  }

  Widget posterImageView() {
    return CachedNetworkImage(
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.fitHeight,
      placeholderFadeInDuration: const Duration(seconds: 1),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      imageUrl: '$imageApi${movie.posterPath ?? ''}',
    );
  }

  Widget titleView() {
    return SizedBox(
      width: DeviceHelper.screenWidth - imageWidth - (cellHPadding * 2) - spacing,
      child: Text(
        movie.title ?? '',
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget descriptionView() {
    return SizedBox(
      width: DeviceHelper.screenWidth - imageWidth - (cellHPadding * 2) - spacing,
      child: Text( movie.overview ?? '',
        style: const TextStyle(fontSize: 10),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
      ),
    );
  }
}
