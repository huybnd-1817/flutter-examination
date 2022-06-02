import 'package:flutter/material.dart';
import 'package:flutter_examination/di/app_providers.dart';
import 'package:flutter_examination/views/movie/movie_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.white
      ),
      home: MoviePage(),
    );
  }
}