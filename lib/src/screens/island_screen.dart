
import 'package:app_flutter_3_a/src/models/models.dart';
import 'package:app_flutter_3_a/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IslandScreen extends StatelessWidget {
   
  const IslandScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 20,);
    return Scaffold(
      body: Column(
        children:const [
        
          InputDataWidget(),
          
          sizedBox,
          
          Expanded(
            child: _IslandContentWidget(),
          ),
          
          _TotalWidget(),
          
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}


class _IslandContentWidget extends StatelessWidget {
  
  const _IslandContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final islandModelProvider =  Provider.of<IslandModel>(context);


    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: double.infinity,
      width: double.infinity,
      child: islandModelProvider.matrizSize != 0 
        ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: islandModelProvider.matrizSize ,
          ),
          itemCount: islandModelProvider.matrizSize * islandModelProvider.matrizSize,
          itemBuilder: (BuildContext context, int index) {
            return _IslandElementWidget(posX: (index ~/ islandModelProvider.matrizSize).floor() , posY: (index % islandModelProvider.matrizSize),);
          }
          )
        : Container(),
    );
  }
}


class _IslandElementWidget extends StatelessWidget {
  
  final bool isWater;
  final int posX;
  final int posY;

  const _IslandElementWidget({
    Key? key, this.isWater = false, required this.posX, required this.posY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final islandModelProvider =  Provider.of<IslandModel>(context);
    final value = islandModelProvider.matriz[posX][posY];
  
    return GestureDetector (
      onTap: () {
        
        Provider.of<IslandModel>(context, listen: false).updateItem(
          posX,
          posY,
          1 - value
        );
        
        
      },
      child: Card (
        color: value == 0 
          ? Colors.blueAccent 
          : Colors.white,
        child: value == 0 
          ? const Center(
            child: Image(image: AssetImage('assets/river.jpg'),),
          )
          : const Center(
            child: Image(image: AssetImage('assets/palmera.png'),),
          ),
      ),
    );
  }
}


class _TotalWidget extends StatelessWidget {
  const _TotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final islandModelProvider =  Provider.of<IslandModel>(context);

    return islandModelProvider.matrizSize != 0 
    ? Container (
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child: Container (
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[500],

        ),
        child: Center (
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ISLAS ENCONTRADAS: ', style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.bold
              ),),
              Text('${islandModelProvider.islandCount}',  style: const TextStyle (
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ))
            ],
          )
        ),
      ),
    )
    : Container();
  }
}