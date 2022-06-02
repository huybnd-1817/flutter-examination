import 'package:flutter/material.dart';

class MovieInfoView extends StatelessWidget {
  final String category;
  final String info;

  final double padding = 16.0;

  const MovieInfoView({Key? key, required this.category, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              category,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              info,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
