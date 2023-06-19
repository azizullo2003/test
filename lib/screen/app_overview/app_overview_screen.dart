import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../login/login_screen.dart';

class AppOverviewScreen extends StatefulWidget {
  const AppOverviewScreen({super.key});

  @override
  State<AppOverviewScreen> createState() => _AppOverviewScreenState();
}

class _AppOverviewScreenState extends State<AppOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IntroductionScreen(
        //TODO: custom progress
        //TODO: paint lines like in figma
        //TODO: custom arrow like in figma
        //TODO: shadow under 3 picture
        showNextButton: true,
        next: const Icon(Icons.arrow_forward),
        done: const Icon(Icons.arrow_forward),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        pages: [
          pageOverview(1, 'transaction', context),
          pageOverview(2, 'regulation', context),
          pageOverview(3, 'currencies', context),
        ],
      ),
    );
  }

  PageViewModel pageOverview(
    int pageNumber,
    String imagePath,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'overview${pageNumber}Title',
                  style: theme.textTheme.displaySmall,
                ).tr(),
                const SizedBox(height: 16),
                Text(
                  'overview${pageNumber}Body',
                  style: theme.textTheme.labelMedium,
                ).tr(),
              ],
            ),
          ),
          const SizedBox(height: 45),
          Image.asset(
            'assets/images/$imagePath.png',
          ),
        ],
      ),
    );
  }
}
