import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1657446733019-1d88b949a8e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
           height: 230,
          fit: BoxFit.fitHeight,
          ),
          Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            '\$ 100',
            style: TextStyle(fontSize: 18),
          ),
        ),  
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15, right: 40),
          child: Text(
            'yabon',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ), 
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://images.unsplash.com/photo-1657514041462-b55eef71b1c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60', fit: BoxFit.fitWidth, width: 100, height: 100,),
              SizedBox(width: 10,),
              Image.network('https://images.unsplash.com/photo-1657514041462-b55eef71b1c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60', fit: BoxFit.fitWidth, width: 100, height: 100,),
              SizedBox(width: 10,),
              Image.network('https://images.unsplash.com/photo-1657514041462-b55eef71b1c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60', fit: BoxFit.fitWidth, width: 100, height: 100,),
              SizedBox(width: 10,),
              Image.network('https://images.unsplash.com/photo-1657514041462-b55eef71b1c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60', fit: BoxFit.fitWidth, width: 100, height: 100,),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.topLeft,
          child: const Text(
            'See All',
            style: TextStyle(
              color: Colors.cyan,
            ),
          ),
        ),       
      ],
    );
  }
}