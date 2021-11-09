import 'package:businessmodel/pages/login.dart';
import 'package:businessmodel/pages/phoneauth.dart';
import 'package:businessmodel/pages/sgnup.dart';
import 'package:businessmodel/routing/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/phoneauth.dart';
import 'pages/sgnup.dart';
import 'routing/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => login(),
          MyRoute.signup: (context) => signup(),
          MyRoute.phone: (context) => phone(),
        });
  }
}
