import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:merchant_kyc_app/screen/signup_screen/signup_screen.dart';

import '../../helper_widgets/custom_button.dart';
import '../navigation_bar/navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Log in', style: theme.textTheme.displaySmall).tr(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'email'.tr()),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'password'.tr()),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        //TODO: sighnup screen
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'signup',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(56, 124, 255, 1),
                          ),
                        ).tr(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'signHelp',
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.hintColor,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const NavigationScreen(),
                          ),
                        );
                      },
                      child: const Text('login').tr(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
