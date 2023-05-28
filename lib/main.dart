import 'package:amozon_clone/common/bottom_bar.dart';
import 'package:amozon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amozon_clone/features/admin/screen/admin_screen.dart';
import 'package:amozon_clone/features/auth/service/auth_service.dart';
import 'package:amozon_clone/features/home/screen/home_screen.dart';
import 'package:amozon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'constant/const.dart';
import 'package:amozon_clone/route.dart';
import 'package:provider/provider.dart';
import 'features/auth/screen/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
            color: Colors.teal,
          ))),
      onGenerateRoute: (settings) => generateRoute(settings),
      // goes to bottombay if token not emlty
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.role == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const Auth_Screen(),
    );
  }
}
