import 'package:app_flutter_3_a/src/screens/screens.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Islas'),
        actions:  [
          GestureDetector(
            onTap: (){
                Navigator.pushNamed(context, 'favourite');
            },
            child: const Icon(Icons.favorite_border_outlined)
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: IslandScreen(),
      ),
    );
  }
}