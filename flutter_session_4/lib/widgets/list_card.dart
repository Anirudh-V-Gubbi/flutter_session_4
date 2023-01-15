import 'package:flutter/material.dart';
import 'package:flutter_session_4/constants.dart';
import 'package:flutter_session_4/screens/details_screen.dart';
import 'package:flutter_session_4/show_model.dart';

class ListCard extends StatelessWidget {
  final ShowModel show;
  final Function callback;
  const ListCard({
    required this.show,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => DetailsPage(
          //       title: title,
          //     ),
          //   ),
          // );
          await Navigator.of(context).pushNamed(DetailsPage.routeName,arguments: show);
          callback();
        },
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            bottom: 10.0,
            top: 10.0,
          ),
          child: (Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(moviePoster),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        show.title,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        show.fullTitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
