import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/sign_up_screen.dart';
import 'package:tiktok_clone/views/widgets/button_widget.dart';
import 'package:tiktok_clone/views/widgets/input_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _login() {
    authController.login(emailController.text, passwordController.text);
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
                height: 25,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 25,
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
                    _login();
                  },
                  title: 'Login',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      'Register',
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
