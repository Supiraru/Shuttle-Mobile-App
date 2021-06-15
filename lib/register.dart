import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 730) {
            return RegisterScreenMobile();
          } else if (constraints.maxWidth <= 1200) {
            return RegisterScreenWeb(
              widthInput: 300.0,
              scalePicture: 0.9,
            );
          } else if (constraints.maxWidth <= 1300) {
            return RegisterScreenWeb(
              widthInput: 400.0,
              scalePicture: 0.75,
            );
          } else if (constraints.maxWidth <= 1500) {
            return RegisterScreenWeb(
              widthInput: 500.0,
              scalePicture: 0.5,
            );
          } else {
            return RegisterScreenWeb(
              widthInput: 600.0,
              scalePicture: 0.5,
            );
          }
        },
      ),
    );
  }
}

class RegisterScreenMobile extends StatelessWidget {
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

    Widget signUpButton() {
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
            'Create Account',
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
                        child: Text("Sign Up",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    input("Username"),
                    input("Email"),
                    input("Password", password: true),
                    input("Confirm Password", password: true),
                    signUpButton(),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                            "By Signing up you agree to the Terms of Service and Privacy Policy",
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

class RegisterScreenWeb extends StatelessWidget {
  final double widthInput, scalePicture;

  RegisterScreenWeb({required this.widthInput, required this.scalePicture});

  @override
  Widget build(BuildContext context) {
    Widget input(String hint, {bool password = false}) {
      return Container(
        height: 50,
        width: widthInput,
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

    Widget signUpButton() {
      return Container(
        height: 50,
        width: widthInput,
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
            'Create Account',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/landing-page-logo.png', scale: scalePicture,),
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              input("Username"),
              input("Email"),
              input("Password", password: true),
              input("Confirm Password", password: true),
              signUpButton(),
              Container(
                width: 250,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                      "By Signing up you agree to the Terms of Service and Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey)))
            ],
          ))
        ],
      ),
    );
  }
}
