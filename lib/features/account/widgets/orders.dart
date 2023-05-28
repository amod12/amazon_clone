import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // temporary list
  List items = [
    'https://images.unsplash.com/photo-1657446733019-1d88b949a8e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
    'https://images.unsplash.com/photo-1657446733019-1d88b949a8e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
    'https://images.unsplash.com/photo-1657446733019-1d88b949a8e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(right: 15),
              child: const Text(
                'See All',
                style: TextStyle(
                  color: GlobalVariables.cyan,
                  ),
              ),
            ),
          ],
        ),
        // display orders  border outside the picture
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 10, right: 0, top: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,

                itemBuilder: (context, index) {
                  return SingleProduct(
                    image: items[index],
                  );
                }
                ),
            ),
      ],
    );
  }
}