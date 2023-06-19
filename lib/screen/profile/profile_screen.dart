import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../helper_widgets/button_chip.dart';
import '../../helper_widgets/gradient_app_bar.dart';
import '../settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          GradientAppBar(
            title: 'profile'.tr(),
            height: size.height * 0.35,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).canvasColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: IconButton(
              //TODO: extract from figma
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).canvasColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
            ),
            content: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.account_circle_sharp,
                        size: 150,
                      ),
                      Positioned(
                        bottom: 5,
                        left: 100,
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Name Name',
                    style: theme.textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonChip(
                        icon: const Icon(
                          //TODO: extract from figma
                          Icons.lock,
                          color: Colors.green,
                        ),
                        title: 'accountSecurity'.tr(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ButtonChip(
                        //TODO: extract from figma
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.green,
                        ),
                        title: 'notification'.tr(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ButtonChip(
                        //TODO: extract from figma
                        icon: const Icon(
                          Icons.verified,
                          color: Colors.green,
                        ),
                        title: 'accountVerification'.tr(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
