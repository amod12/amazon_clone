import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.all(10),
      // EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(children: [
        RichText(
          text: TextSpan(
              text: 'Hello,',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ]),
        ),
      ]),
    );
  }
}
