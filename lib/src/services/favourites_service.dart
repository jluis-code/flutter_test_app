import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_flutter_3_a/src/models/models.dart';

class FavouriteProvider extends ChangeNotifier{


  static const String _urlBase = 'https://api.giphy.com';
  static const String _searchOption = 'v1/gifs/search';
  static const String _apiKey = 'MiC4Q6sLmMllbcuN1bZir34cWzuRdyvR';

  bool isLoading = false;

  String _selectedCategory = 'All';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String category){
    _selectedCategory = category;
    searchByCategory();
    notifyListeners();
  }

  List<Category> categories = [
    Category('All'),
    Category('Happy Hours'),
    Category('Drinks'),
    Category('Beer'),
  ];

  List<BottomOption> bottomOptions = [
    BottomOption('Home', Icons.home_sharp),
    BottomOption('Calendar', Icons.calendar_today_outlined),
    BottomOption('Search', Icons.search_rounded),
    BottomOption('Favorites', Icons.favorite_border_outlined),
  ];


  Map<String, List<GifData>> categoryResultData = {};

  FavouriteProvider(){
    for (var element in categories) {
      categoryResultData[element.name] =  [];
    }
    searchByCategory();
  }

  searchByCategory() async {

    log('searchByCategory()');
    isLoading = true;
    notifyListeners();

    if (categoryResultData[selectedCategory] != null && categoryResultData[selectedCategory]!.isNotEmpty)
    {
      log('ya existe en memoria');
      isLoading = false;
      notifyListeners();
      return categoryResultData[selectedCategory];
    }

    String url = '$_urlBase/$_searchOption?&apiKey=$_apiKey&q=restaurants $_selectedCategory';
    log('url: $url');
    final resp = await http.get(Uri.parse(url));
    
    final searchResponse = SearchGifResponse.fromJson(resp.body);
    
    categoryResultData[selectedCategory]?.addAll(searchResponse.data);
    isLoading = false;
    notifyListeners();

    return categoryResultData[selectedCategory];

  }

  List<GifData>? get getArticlesByCategorySelected => categoryResultData[selectedCategory];


  bool isCategorySelected(String name){
    return _selectedCategory == name;
  }
}
