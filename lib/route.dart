import 'package:amozon_clone/common/bottom_bar.dart';
import 'package:amozon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amozon_clone/features/auth/screen/auth_screen.dart';
import 'package:amozon_clone/features/home/screen/category_screen.dart';
import 'package:amozon_clone/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Auth_Screen.routeName:
      return MaterialPageRoute(
        builder: (_) => const Auth_Screen(),
        settings: routeSettings,
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: routeSettings,
      );

    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryScreen(category: category),
        settings: routeSettings,
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
        settings: routeSettings,
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
        settings: routeSettings,
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('NO SCREEN'),
          ),
        ),
        settings: routeSettings,
      );
  }
}
