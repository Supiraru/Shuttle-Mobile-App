import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return LoginScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget input(String hint, {bool password = false}) {
      return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: password,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: hint,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/home");
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    }

    return Scrollbar(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('assets/images/landing-page-logo.png'),
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text("Sign In",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text(
                        "Sign in to access your account",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Email Address",
                        style: TextStyle(fontSize: 15),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    input("example@gmail.com"),
                    Container(
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 15),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    input("Password", password: true),
                    signInButton(),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text("Don't have an account yet? Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey)))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
