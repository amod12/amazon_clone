import 'package:amozon_clone/features/account/widgets/account_buttons.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(text: 'Orders', onPressed: (){}),
            AccountButton(text: 'Turn Seller', onPressed: (){}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AccountButton(text: 'Log Out', onPressed: (){}),
            AccountButton(text: 'Wish List', onPressed: (){}),
          ],
        ),
      ],
    );
  }
}