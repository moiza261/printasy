import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/controllers/controller.dart';
import 'package:social_app/views/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Controllers controllers = Controllers();
  Future<void> _signOut(
    String text,
  ) async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar(text, 'User Signout');
     Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  String name = '';
  String email = '';
  String password = '';
  void getUserData() async {
    final ds = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      name = ds['name'];
      email = ds['email'];
      password = ds['password'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                padding: EdgeInsets.only(bottom: 50),
                color: Colors.red,
                alignment: Alignment.center,
                height: 180,
                child: const Text(
                  'Profile Screen',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: FontStyless.usernamefont,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
                child: MyTextField(
                  hintText: name,
                  controller: nameController,
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.email)),
                  obsecureText: false,
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: FontStyless.usernamefont,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
                child: MyTextField(
                  hintText: email,
                  controller: nameController,
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.email)),
                  obsecureText: false,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: FontStyless.usernamefont,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
                child: MyTextField(
                  hintText: password,
                  controller: nameController,
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.email)),
                  obsecureText: false,
                )),
            // SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.red,
            //     fixedSize: const Size(240, 40),
            //     shape: const StadiumBorder(
            //       side: BorderSide.none,
            //     ),
            //   ),
            //   onPressed: () {},
            //   child: Text('Update'),
            // ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                fixedSize: const Size(240, 40),
                shape: const StadiumBorder(
                  side: BorderSide.none,
                ),
              ),
              onPressed: () {
                newDailog(name, 'User SignOut');
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> newDailog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _signOut(name);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
