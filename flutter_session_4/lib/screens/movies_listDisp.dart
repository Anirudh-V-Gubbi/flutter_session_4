import 'package:flutter/material.dart';
import 'package:flutter_session_4/show_model.dart';
import 'package:flutter_session_4/widgets/list_card.dart';
import 'package:hive/hive.dart';

class MoviesListDisp extends StatefulWidget {
  const MoviesListDisp({Key? key}) : super(key: key);

  @override
  _MoviesListDispState createState() => _MoviesListDispState();
}

class _MoviesListDispState extends State<MoviesListDisp> {
  List favList = [];

  @override
  void initState()
  {
    super.initState();
    getFavourites();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListCard(
              show: ShowModel(
                title: 'Sherlock $index',
                fullTitle: 'Sherlock Holmes $index',
                isFavourite: isFavourite('Sherlock $index')
              ),
              callback: () {
                setState(() {
                  
                });
              }
            );
          }),
    );
  }

  void getFavourites()
  {
    var box = Hive.box("FavouriteShows");
    favList = box.get("movies", defaultValue: []);
  }

  bool isFavourite(String title)
  {
    for(final show in favList)
    {
      if((show as ShowModel).title == title) {
        return true;
      }
    }

    return false;
  }
}
