import 'package:flutter/material.dart';
import 'package:flutter_session_4/screens/favourite_screen.dart';
import 'package:flutter_session_4/screens/movies_listDisp.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool darkMode = true;

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List favouriteShows = [];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Movies and TV Shows",
            style: TextStyle(fontFamily: "Dongle", fontSize: 20.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavouriteScreen()));
              },
              child: const Icon(
                Icons.favorite,
              ),
            )
          ],
        ),
        body: const MoviesListDisp());
  }
}
