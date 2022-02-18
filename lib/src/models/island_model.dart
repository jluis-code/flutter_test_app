import 'package:app_flutter_3_a/src/models/island_count.dart';
import 'package:flutter/cupertino.dart';

class IslandModel  extends ChangeNotifier{
  
  int _matrizSize = 0;
  int _islandCount = 0;

  int _m = 0;
  int _n = 0;

  late List<List<int>> matriz;
  late List<List<int>> visitedMatriz;

  IslandModel(){
     matriz = initMatriz(_m, _n);
  }

  int get matrizSize => _matrizSize;
  set matrizSize(int value){
    _matrizSize = value;
    _m = value;
    _n = value;
    if(value != 0) {
      matriz = initMatriz(_m, _n);
      _islandCount = countIslandNumber(matriz);
    } else {
      matriz = [];
    }
    notifyListeners();
  }

  int get islandCount => _islandCount;
  set islandCount(int value){
    _islandCount = value;
    notifyListeners();
  }

  updateItem(int posX, int posY, int value) {
    matriz[posX][posY] = value;
    _islandCount = countIslandNumber(matriz);
    notifyListeners();
  }

}