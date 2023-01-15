import 'package:flutter/material.dart';
import 'package:flutter_session_4/constants.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Image.asset(castImage),
          const Expanded(
            child: Center(
              child: Text(
                "Benedict as Sherlock",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
