import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/controllers/controller.dart';
import 'package:social_app/views/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Controllers controllers = Controllers();

  @override
  void initState() {
    super.initState();
    controllers.splasScreen(const Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  top: 120,
                  left: 70,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(130), // Image radius
                      child: Image.asset('assets/images/printasy.jpg',
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                bottom: 330,
                left: 135,
                child: Text(
                  'Printasy',
                  style: FontStyless.poppinssizeBold30,
                ),
              ),
              Positioned(
                bottom: 300,
                left: 100,
                child: Text(
                  'Best Digital Printing Solutions',
                  style: FontStyless.poppinsRegualr,
                ),
              ),
              // Positioned(
              //     bottom: 10,
              //     right: 10,
              //     child: Text(
              //       'Powered By Moiz Shiekh',
              //       style: FontStyless.poppinsSemiBold,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
