import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/core/helper/assets_helper.dart';
import 'package:tiktok_clone/views/widgets/button_widget.dart';
import 'package:tiktok_clone/views/widgets/input_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _register() {
    authController.registerUser(
      usernameController.text,
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TikTok Clone',
                style: TextStyle(
                    fontSize: 35,
                    color: buttonColor,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Register',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  const SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                          AssetsHelper.avatar,
                        ),
                      )),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Container(
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 30,
                        ),
                        onPressed: () {
                          authController.pickImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: InputTextField(
                    controller: usernameController,
                    label: 'Username',
                    icon: Icons.person),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: InputTextField(
                    controller: emailController,
                    label: 'Email',
                    icon: Icons.email),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: InputTextField(
                  controller: passwordController,
                  label: 'Password',
                  icon: Icons.lock,
                  isObsecure: true,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonWidget(
                  onTap: () {
                    _register();
                  },
                  title: 'Register',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: buttonColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
