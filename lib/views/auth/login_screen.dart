import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/controllers/controller.dart';
import 'package:social_app/views/auth/register_screen.dart';
import 'package:social_app/views/homescreen/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController =
      TextEditingController(text: 'moiza261@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Moiz@1234');
  Controllers controllers = Controllers();
  bool hasbeenPressed = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(100), // Image radius
                    child: Image.asset('assets/images/printasy.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: FontStyless.loginFont,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username & Email',
                      style: FontStyless.usernamefont,
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 20, top: 10),
                    child: MyTextField(
                      hintText: 'something@gmail.com',
                      controller: emailController,
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
                      'Password',
                      style: FontStyless.usernamefont,
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 20, top: 10),
                    child: MyTextField(
                      hintText: 'Enter Your Password',
                      controller: passwordController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hasbeenPressed = !hasbeenPressed;
                          });
                        },
                        icon: hasbeenPressed
                            ? const Icon(Icons.lock)
                            : const Icon(Icons.lock_open),
                      ),
                      obsecureText: hasbeenPressed,
                    )),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: ((context) => Reset())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: FontStyless.poppinsColorGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          fixedSize: const Size(240, 40),
                          shape: const StadiumBorder(
                            side: BorderSide.none,
                          ),
                        ),
                        onPressed: () {
                        
                          try {
                            controllers.signIn(
                                emailController.text, passwordController.text);
                            setState(() {
                              emailController.text = '';
                              passwordController.text = '';
                            });
                          } on FirebaseAuthException catch (e) {
                            Get.snackbar(e.toString(), e.toString());
                          }
                        },
                        child: const Text('Login'),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not yet account',
                      style: FontStyless.poppinsColorGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const Register(),
                        );
                      },
                      child: Text(
                        'Register',
                        style: FontStyless.poppinsColorbalck,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // signInWithGoogle();
                      },
                      child: const Image(
                        image: AssetImage(
                          'assets/images/google.png',
                        ),
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      // onTap: (() => loginwithFacebook()),
                      child: const Image(
                        image: AssetImage(
                          'assets/images/facebook.png',
                        ),
                        width: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
