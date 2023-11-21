import 'package:flutter/material.dart';
import 'package:snapy/src/components/myButton.dart';
import 'package:snapy/src/components/myTextfield.dart';
import 'package:snapy/src/components/squareTile.dart';
import 'package:snapy/src/controllers/authController.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find();


  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    // Theme 데이터 참조
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Snapy',
                style: TextStyle(
                  color: theme.colorScheme.onBackground,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'the best-simple timer logger',
                style: TextStyle(
                  color: theme.colorScheme.onBackground,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: theme.dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        child: SquareTile(imagePath: 'lib/src/images/google.png'),
                        onTap: () async {
                          print("signin excuted");
                          await authController.signInWithGoogle();
                        },
                      )
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: theme.dividerColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't you have Google account?",
                    style: TextStyle(color: theme.colorScheme.onBackground),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async{
                      final Uri url = Uri.parse('https://support.google.com/accounts/answer/27441?hl=en');
                      if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                      }
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
