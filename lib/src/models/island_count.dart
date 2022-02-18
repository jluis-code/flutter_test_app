import 'dart:developer';
import 'dart:math' as math;

int countIslandNumber(List<List<int>> matriz) {
  final m = matriz.length;
  final n = matriz.first.length;

  //1. Define matriz visited
  List<List<bool>> visited = initVisitMatriz(m, n);
  printMatriz(visited, 'Visited');

  int result = 0;

  //2. For every element in matriz check value
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (matriz[i][j] == 1 && !visited[i][j]) {
        dfs(matriz, visited, i, j);
        result++;
      }
    }
  }

  printMatriz(visited, 'Visited');
  log('result: $result');

  return result;
}
//Check adjacent elements : Lef, Right, Top and Bottom
//Validate indices with validateArea
dfs(List<List<int>> matriz, List<List<bool>> visited, int x, int y) async{
  
  List<List<int>> direction = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ];

  final m = matriz.length;
  final n = matriz.first.length;

  visited[x][y] = true;
  for (int i = 0; i < 4; i++) {
    int newx = x + direction[i][0];
    int newy = y + direction[i][1];
    if (validateArea(m, n, newx, newy) &&
        !visited[newx][newy] &&
        matriz[newx][newy] == 1) {
      dfs(matriz, visited, newx, newy);
    }
  }
}

validateArea(int m, int n, int x, int y) {
  return x >= 0 && x < m && y >= 0 && y < n;
}

initVisitMatriz(int columns, int rows) {
  return List.generate(
      columns, (index) => List.generate(rows, (index) => false));
}

//Auxiliar function to print matriz on console
printMatriz(List<List> matriz, String titulo) {
 
  log.call('====== $titulo ======');
  for (var i = 0; i < matriz.length; i++) {
    var item = matriz[i];
    log.call('$i: $item');
    log.call('\n');
  }
}


initMatriz(int columns, int rows) {
  return List.generate(
      columns, (index) => List.generate(rows, (index) => math.Random().nextInt(2)));
}
