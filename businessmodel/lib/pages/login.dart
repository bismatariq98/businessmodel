import 'package:businessmodel/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03254c),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 60),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //for logo
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  //for  Title
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 03,
                  ),
                  //for sub-title
                  Text(
                    "Sign In to Continue",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //for username
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xff003d80),
                        borderRadius: BorderRadius.circular(05)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0, top: 05),
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "Enter Your Email",
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              size: 20,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //for password
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff003d80),
                        borderRadius: BorderRadius.circular(05)),
                    width: double.infinity,
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0, top: 05),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              size: 20,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //for login
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoute.signup);
                    },
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 40.0,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SignInButton(
                          Buttons.Google,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
