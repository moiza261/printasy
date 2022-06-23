import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/controllers/constants.dart';
import 'package:social_app/controllers/controller.dart';
import 'package:social_app/views/auth/login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Controllers controllers = Controllers();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hasbeenPressed = true;
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    'Create An Account',
                    style: FontStyless.loginFont,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: FontStyless.usernamefont,
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 20, top: 10),
                      child: MyTextField(
                        hintText: 'Enter Your Name',
                        controller: nameController,
                        prefixIcon: const Icon(Icons.person),
                        obsecureText: false,
                      )),
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
                        controllers.register(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                            const Login());
                        setState(() {
                          nameController.text = '';
                          passwordController.text = '';
                          emailController.text = '';
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account',
                        style: FontStyless.poppinsColorGrey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const Login());
                        },
                        child: Text(
                          'Login',
                          style: FontStyless.poppinsColorbalck,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
