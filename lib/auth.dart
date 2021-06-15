import 'package:flutter/material.dart';
import 'package:shuttle/register.dart';
import 'package:shuttle/login.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 750) {
            return AuthScreenMobile();
          } else if(constraints.maxWidth <= 1200){
            return AuthScreenWeb(widthInput: 300.0, scalePicture: 0.9,);
          }else if(constraints.maxWidth <= 1300){
            return AuthScreenWeb(widthInput: 400.0, scalePicture: 0.75,);
          }else if(constraints.maxWidth <= 1500){
            return AuthScreenWeb(widthInput: 500.0, scalePicture: 0.5,);
          }else{
            return AuthScreenWeb(widthInput: 600.0, scalePicture: 0.5,);
          }
        },
      ),
    );
  }
}

class AuthScreenMobile extends StatelessWidget {
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
                  hintText: hint,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/landing-page-logo.png'),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Register();
                        }));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 30),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class AuthScreenWeb extends StatelessWidget {
  final double widthInput, scalePicture;

  AuthScreenWeb({required this.widthInput, required this.scalePicture});

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
                  hintText: hint,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/landing-page-logo.png', scale: scalePicture,),
            ),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: widthInput,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Register();
                  }));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: widthInput,
                    margin: EdgeInsets.only(bottom: 30),
                    child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                    ),
                  ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
