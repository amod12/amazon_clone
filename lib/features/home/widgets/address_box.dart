import 'package:amozon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressBox extends StatelessWidget {
  const AdressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 69, 232, 224),
        ],
        stops: [0.5, 1]
        ),
      ),
      child: Row(children: [
        const Icon(Icons.location_on_outlined, size: 20,),

        Expanded(
          child: Padding(
            padding:  EdgeInsets.only(left: 5),
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              ),
            ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 5, top: 5),
          child: Icon(Icons.arrow_drop_up_outlined, size: 18,),
          // since expanded above icon wiil show at corner of container
        ),
      ],
      ),
    );
  }
}