import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../helper_widgets/gradient_app_bar.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  int switchValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          GradientAppBar(
            title: 'withdraw'.tr(),
            height: size.height * 0.2,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: theme.canvasColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            content: Center(
              child: SizedBox(
                height: 40,
                child: AnimatedToggleSwitch<int>.size(
                  current: switchValue,
                  animationDuration: const Duration(milliseconds: 200),
                  values: const [0, 1],
                  indicatorSize: const Size.fromWidth(175),
                  iconAnimationType: AnimationType.onHover,
                  indicatorAnimationType: AnimationType.onHover,
                  iconBuilder: (value, size) {
                    return Center(
                        child: Text(
                      value == 0 ? 'fiat' : 'crypto',
                      style: theme.textTheme.labelMedium,
                    ).tr());
                  },
                  innerColor: Constants.transparentColor,
                  borderWidth: 0.0,
                  borderColor: Colors.transparent,
                  colorBuilder: (i) => Colors.white,
                  onChanged: (i) {
                    setState(() => switchValue = i);
                  },
                ),
              ),
            ),
          ),
          const Expanded(child: Placeholder())
        ],
      ),
    );
  }
}
