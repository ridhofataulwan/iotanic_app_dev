// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:iotanic_app_dev/main.dart';
import 'package:iotanic_app_dev/model/user.dart';
import 'package:iotanic_app_dev/view/App/index.dart';
import 'package:iotanic_app_dev/view/Auth/signup.dart';
import 'package:provider/provider.dart';

import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:iotanic_app_dev/view/App/home.dart';
// import 'package:hexcolor/hexcolor.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    email.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    email.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('email text field: ${email.text}');
  }

  @override
  Widget build(BuildContext context) {
    User? user;

    double screenWidth = MediaQuery.of(context).size.width;
    ThemeProvider themes = ThemeProvider();

    bool passwordVisible = false;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15, vertical: screenWidth * 0.2),
                child: themes.getLogo,
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                  children: [
                    Builder(
                      builder: (context) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || !isEmail(value)) {
                              return 'Email is not valid!';
                            }
                          },
                          style: TextStyle(color: Theme.of(context).primaryColor),
                          controller: email,
                          obscureText: false,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Email / Phone Number',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                            ),
                            // hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                            fillColor: Theme.of(context).highlightColor,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: TextFormField(
                          controller: password,
                          obscureText: !passwordVisible,
                          autofocus: false,
                          style: TextStyle(color: Theme.of(context).primaryColor),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                            fillColor: Theme.of(context).highlightColor,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.only(right: 15),
                              icon: Icon(
                                passwordVisible == true ? Icons.visibility_off : Icons.visibility,
                                color: Theme.of(context).primaryColorLight,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const Index();
                      }),
                    );

                    // User.connectToApi('2cb9c27e-cc71-4870-95c2-a2a2f4aad07a').then((value) {
                    //   user = value;
                    //   setState(() {});
                    // });
                    // print(email.text);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: 17),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      )),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 50), child: Text('Lupa Passsword? Atau', style: TextStyle(color: Theme.of(context).primaryColor))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45.0),
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      themeProvider.swapTheme();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(screenWidth * 0.3, 5),
                        maximumSize: Size(screenWidth * 0.6, 40),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))),
                    child: Row(children: [
                      Image.network(
                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                        width: 50,
                        height: 50,
                      ),
                      const Text(
                        "Masuk Dengan Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum memiliki akun? ',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUp();
                        }),
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
