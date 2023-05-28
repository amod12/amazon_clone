import 'package:amozon_clone/features/admin/screen/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:amozon_clone/constant/const.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const PostScreen(),
    const Center(child: Text('analytical')),
    const Center(child: Text('cart')),
  ];
// here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120.0,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 30,
        onTap:
            updatePage, // whentapping 1 st icon its in 0th place so 0 returns as page.
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
                // shows line at top of icon t know its selected
              )),
              child: const Icon(Icons.home_outlined),
            ),
            // important to put label as it is required field
            label: '',
          ),

          // analytics
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
              child: const Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),

          // order
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
              child: const Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
