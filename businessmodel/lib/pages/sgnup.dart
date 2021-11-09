import 'package:businessmodel/routing/route.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03254c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
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
                    "Create Account",
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
                    "Sign Up to Continue",
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
                            "Username",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "Enter Your Username",
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

                  //for Signup
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, left: 28.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoute.phone);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 40.0,
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
