import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/features/account/screen/account_screen.dart';
import 'package:amozon_clone/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('cart')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 30,
        onTap: updatePage,
        items: [
          // home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.cyan
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth),
              )),
              child: const Icon(Icons.home_outlined),
            ),
            // important to put label
            label: '',
          ),

          // account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.cyan
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth),
              )),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),

          // cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.cyan
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth),
              )),
              child: Badge(
                  elevation: 0,
                  badgeContent: const Text('2'),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.shopping_cart_outlined)),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
