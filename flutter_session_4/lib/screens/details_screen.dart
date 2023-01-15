import 'package:flutter/material.dart';
import 'package:flutter_session_4/constants.dart';
import 'package:flutter_session_4/show_model.dart';
import 'package:flutter_session_4/widgets/cast_card.dart';
import 'package:hive/hive.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';

  // final String title;
  const DetailsPage({
    Key? key,
    // required this.title,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    ShowModel args = ModalRoute.of(context)!.settings.arguments as ShowModel;
    if(args.isFavourite == true) {
      isFavourite = args.isFavourite;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // widget.title,
        args.title,
        ), //appRepo.listMovie[ind]["title"]),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isFavourite == true
        ? Colors.redAccent
        : Colors.indigoAccent,
        onPressed: () {
          if(isFavourite == false) {
            storeInBox(args);
            isFavourite = true;
            setState(() {
              
            });
          }
        },
        child: Icon(Icons.favorite),
        tooltip: "Add To WatchList",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30.0,
            ),
            SizedBox(
                height: 200, width: 100, child: Image.network(moviePoster)),
            Container(
              height: 40.0,
            ),
            const Text(
              "Description",
            ),
            Container(
              height: 30.0,
            ),
            const Text(
              "Cast:",
            ),
            SizedBox(
              height: 100,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CastCard();
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "IMDb Rating",
            ),
            const Text(
              "IMDb Rating Count",
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigoAccent)),
                onPressed: () {
                  //Youtube Open Logic
                },
                child: const Text(
                  "YouTube Link",
                )),
          ],
        ),
      ),
    );
  }

  void storeInBox(ShowModel show)
  {
    var box = Hive.box("FavouriteShows");
    List moviesList = box.get("movies", defaultValue: []);
    moviesList.add(show);
    box.put("movies", moviesList);
  }
}
