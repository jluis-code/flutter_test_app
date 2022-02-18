import 'package:app_flutter_3_a/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final String title;
  final String urlImage;
  
  const MyCard({
    Key? key, required this.title, required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          
          Container(
            alignment: Alignment.centerRight,
            child: const Icon(Icons.more_horiz_outlined, color: Colors.grey,)
          ),
          
          Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                
                children: <Widget>[

                  const SizedBox(
                    width: 140,
                    height: 130,
                  ),

                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif') ,
                          image: NetworkImage(
                            urlImage
                          ),
                          fit: BoxFit.cover,
                          width: 120,
                          height: 90,
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    left: 50.0,
                    top: 85.0,
                    child: MyCircularIcon(child: Icon(Icons.favorite, color: Colors.orange,), size: 40,)
                  )

                  

                ],
              ),

              Expanded(
                child: Text(
                  title, 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              )

            ],
          ),
        ],
      ),
    );
  }
}