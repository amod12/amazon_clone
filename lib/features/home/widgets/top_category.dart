import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/features/home/screen/category_screen.dart';
import 'package:flutter/material.dart';

class TopCategory extends StatelessWidget {
  const TopCategory({Key? key}) : super(key: key);
  void toCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 75,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => toCategoryPage(
                  context, GlobalVariables.categoryImages[index]['title']!),
              // now while tapping the pictures of mobiles, appliances, etc we
              // will go to that page andget data of that page
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        GlobalVariables.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
