import 'package:app_flutter_3_a/src/models/models.dart';
import 'package:app_flutter_3_a/src/services/favourites_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyBottomNavigator extends StatelessWidget {
  const MyBottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final options = favouriteProvider.bottomOptions;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: options.map(
          (item) => _BottonNavigationOption(option: item)).toList()
        )
      );
   
  }
}

class _BottonNavigationOption extends StatelessWidget {

  
  final BottomOption option;

  const _BottonNavigationOption({
    Key? key, required this.option,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
  
    bool esFavorito = option.name == 'Favorites';

    return GestureDetector(
      onTap: (){
        switch (option.name.toLowerCase()) {
          case 'home':
            Navigator.pop(context);
            break;
          default:
        }

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        height: 35,
        child: Row(

          children: [
            Icon(
              option.icon,
              color: esFavorito ? Colors.black : Colors.grey[600]

            ),
            const SizedBox(width: 5,),
            if(esFavorito)
              Text(
                option.name,
                style: GoogleFonts.outfit(
                  color: Colors.black,
                )
              ),
          ],
        ),
      ),
    );
  }
}