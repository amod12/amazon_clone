import 'package:amozon_clone/common/custom_button.dart';
import 'package:amozon_clone/common/text.dart';
import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signup,
  signin,
}

class Auth_Screen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Auth_Screen({Key? key}) : super(key: key);

  @override
  State<Auth_Screen> createState() => _Auth_ScreenState();
}

class _Auth_ScreenState extends State<Auth_Screen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome'),
              ListTile(
                title: Text('Create Account'),
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  // when radio clicked value is  Auth.signup
                  groupValue:
                      _auth, // above written Auth _auth = Auth.signup so at start signup shows
                  onChanged: (Auth? val) {
                    // Auth is data type and in above code Auth is written
                    // because in value and group value Auth.signup is wriiten
                    // if any of value is changed type(Auth) is also changed
                    setState(() {
                      _auth = val!;
                      // ! means it can never be null
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'E-mail',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'password',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            text: 'SignUp',
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ListTile(
                title: Text('Login'),
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'E-mail',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'password',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                            text: 'SignIn',
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
