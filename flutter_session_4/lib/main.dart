import 'package:flutter/material.dart';
import 'package:flutter_session_4/screens/details_screen.dart';
import 'package:flutter_session_4/screens/home_screen.dart';
import 'package:flutter_session_4/show_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShowModelAdapter());
  await Hive.openBox("FavouriteShows");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Movies and TV Shows Application",
    // home: const HomeScreen(),
    theme: ThemeData.light(),
    initialRoute: '/',
    routes: {
      HomeScreen.routeName: (context) => const HomeScreen(),
      DetailsPage.routeName: (context) => const DetailsPage()
    },
  ));
}
