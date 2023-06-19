import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../helper_widgets/gradient_app_bar.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        GradientAppBar(
          title: 'home'.tr(),
          height: size.height * 0.35,
          actions: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            icon: const Icon(
              //TODO: extract from figma
              Icons.account_circle_sharp,
              size: 40,
            ),
          ),
          content: const Placeholder(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'accounts',
                            style: theme.textTheme.titleSmall,
                          ).tr(),
                          const SizedBox(width: 4),
                          const Icon(
                            //TODO: extract from figma
                            Icons.add_box_outlined,
                            color: Color.fromRGBO(100, 234, 184, 1),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      //TODO: extract from figma
                      icon: const Icon(Icons.tune_sharp),
                      onPressed: () {},
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 100,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 24);
                    },
                    itemBuilder: (BuildContext context, index) {
                      return const Placeholder(fallbackHeight: 50);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
