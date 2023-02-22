import 'package:flutter/material.dart';
import 'package:iotanic_app_dev/main.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final focusnode = FocusNode();

    // Http_request dataResponse = Http_request();

    double screenWidth = MediaQuery.of(context).size.width;
    ThemeProvider themes = ThemeProvider();

    final formKey = GlobalKey<FormState>();

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    bool passwordVisible = false;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25, vertical: screenWidth * 0.2),
            child: themes.getLogo,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Material(
                              elevation: 1.5,
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || !isEmail(value)) {
                                    return 'Email is not valid!';
                                  }
                                },
                                controller: email,
                                obscureText: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
                                  fillColor: Theme.of(context).highlightColor,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Material(
                              elevation: 1.5,
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                              shadowColor: Theme.of(context).primaryColor,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return 'Password is not valid!';
                                  }
                                },
                                controller: password,
                                obscureText: !passwordVisible,
                                autofocus: false,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45.0),
                  child: ButtonTheme(
                    child: ElevatedButton(
                      onPressed: () {
                        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                        themeProvider.swapTheme();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: 15),
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
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 50), child: Text('Lupa Passsword', style: TextStyle(color: Theme.of(context).primaryColor))),
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
                Text(
                  'Daftar Akun',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          // Column(
          //   children: [],
          // ),
        ],
      ),
    )));
  }
}