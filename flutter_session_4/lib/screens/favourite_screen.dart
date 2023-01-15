import 'package:flutter/material.dart';
import 'package:flutter_session_4/show_model.dart';
import 'package:hive/hive.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late List favList;

  @override
  void initState()
  {
    super.initState();
    var box = Hive.box("FavouriteShows");
    favList = box.get("movies", defaultValue: []);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          "Favourite Screen"
        ),
      ),
      body: ListView.builder(
        itemCount: favList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Text(
                  (favList[index] as ShowModel).title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}