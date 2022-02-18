// ignore_for_file: prefer_const_constructors

import 'package:app_flutter_3_a/src/models/models.dart';
import 'package:app_flutter_3_a/src/services/favourites_service.dart';
import 'package:app_flutter_3_a/src/widgets/widgets.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
          
              _HeaderContainer(),
          
              _HeaderList(text: favouriteProvider.selectedCategory,),
          
              favouriteProvider.isLoading ?  LoadingWidget(): _ListContainer() ,
            ]
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigator() ,
    );
  }
}

class _HeaderContainer extends StatelessWidget {
  const _HeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.grey[200],
      child: Column(
        children: const [

          _HeaderWidget(),
          
          _HeaderTitle(),
          
          _CategoryContainerWidget(),
        ],
      ),
    );
  }
}

class _ListContainer extends StatelessWidget {
  const _ListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final list = favouriteProvider.getArticlesByCategorySelected;

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: list != null ? list.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return MyCard(title:  list![index].title, urlImage: list[index].images.original.url);
      },
    );

  }
}



class _CategoryContainerWidget extends StatelessWidget {
  const _CategoryContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final categories = favouriteProvider.categories;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map(
          (category) => _CategoryButton(category: category,)).toList()
        )
      );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text('Favorites', style: GoogleFonts.outfit(
            fontWeight: FontWeight.w900,
            fontSize: 50,
            )
          ),

          MyCircularIcon(
            child: FaIcon(FontAwesomeIcons.plus),
          ),

        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        
        const _LogoNasaWidget(),

        Row(

          children: const [
            MyCircularIcon(
              child: FaIcon(FontAwesomeIcons.bell),
            ),
            SizedBox(width: 10),
            MyCircularIcon(
              child: Icon(Icons.settings_sharp)
            ),
            
          ],
        ),
      ]
    );
  }
}

class _LogoNasaWidget extends StatelessWidget {
  const _LogoNasaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo_nasa_v2.png', 
      width: 120.0, 
      height: 120.0,
      fit: BoxFit.cover,
    );
  }
}



class _CategoryButton extends StatelessWidget {

  
  final Category category;

  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
  
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return GestureDetector(
      onTap: (){
        favouriteProvider.selectedCategory = category.name;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: 35,
        decoration: BoxDecoration(
          color: favouriteProvider.isCategorySelected(category.name)
            ? Colors.orange.shade700
            : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow:  [
            BoxShadow(
              color: Colors.black12.withOpacity(0.2),
              offset: const Offset(0,2),
              blurRadius: 2
            )
        ],
        ),
        child: Text(
          category.name,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
            color: favouriteProvider.isCategorySelected(category.name)
            ? Colors.white
            : Colors.black87,
          )
        ),
      ),
    );
  }
}

class _HeaderList extends StatelessWidget {

  final String text;

  const _HeaderList({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(text, style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            )
          ),

          MyCircularIcon(
            child: Icon(Icons.delete_outline_rounded),
          ),

        ],
      ),
    );
  }
}