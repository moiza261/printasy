import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:social_app/views/auth/login_screen.dart';
import 'package:social_app/views/auth/register_screen.dart';
import 'package:social_app/views/auth/splashscreen.dart';
import 'package:social_app/views/homescreen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    Widget firstWidget;
    if (firebaseUser != null) {
      firstWidget = const HomeScreen();
    } else {
      firstWidget = const Login();
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      routes: {
        "/login": (context) => Login(),
        "/regsiter": (context) => Register(),
      },
      home: firstWidget,
    );
  }
}
