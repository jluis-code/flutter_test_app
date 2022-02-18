import 'package:app_flutter_3_a/src/models/island_model.dart';
import 'package:app_flutter_3_a/src/screens/screens.dart';
import 'package:app_flutter_3_a/src/services/favourites_service.dart';
import 'package:app_flutter_3_a/src/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IslandModel()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'home'         : (BuildContext context) => const HomeScreen(),
          'favourite'    : (BuildContext context) => const FavouritesScreen(),
        },
        initialRoute: 'home',
        theme: lighTheme,
      ),
    );
  }
}

