import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git_view/widgets/home/home.dart';
import 'package:lottie/lottie.dart';

import '../custom/app_bar.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120), child: CustomBarWidget()),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                // ignore: sort_child_properties_last
                children: [
                  TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintText: "Username", border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password", border: OutlineInputBorder())),
                  SizedBox(height: 30),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      if (usernameController.text == "admin" &&
                          passwordController.text == "admin") {
                        MaterialPageRoute details = MaterialPageRoute(
                            builder: (context) => HomeScreen());
                        Navigator.push(context, details);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Invalid Credentials. Please check your Username and/or Password"),
                        ));
                      }
                    },
                    child: const Text('Login'),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )));
  }
}
