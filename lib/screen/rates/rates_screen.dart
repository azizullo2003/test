
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../helper_widgets/gradient_app_bar.dart';

class RatesScreen extends StatefulWidget {
  const RatesScreen({super.key});

  @override
  State<RatesScreen> createState() => _RatesScreenState();
}

class _RatesScreenState extends State<RatesScreen> {
  final dropdownController = TextEditingController();
  final dropdownList = [
    'today'.tr(),
    'today'.tr(),
    'today'.tr(),
    'today'.tr(),
  ];

  int switchValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        GradientAppBar(
          title: 'rates'.tr(),
          height: size.height * 0.3,
          actions: IconButton(
            icon: const Icon(
              Icons.account_circle_sharp,
              size: 40,
            ),
            onPressed: () {},
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Placeholder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 160,
                        child: AnimatedToggleSwitch<int>.size(
                          current: switchValue,
                          animationDuration: const Duration(milliseconds: 200),
                          values: const [0, 1],
                          indicatorSize: const Size.fromWidth(100),
                          iconAnimationType: AnimationType.onHover,
                          indicatorAnimationType: AnimationType.onHover,
                          iconBuilder: (value, size) {
                            return Center(
                                child: Text(
                              value == 0 ? 'buy' : 'sell',
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
                      SizedBox(
                        height: 40,
                        width: 110,
                        child: CustomDropdown(
                          onChanged: (p0) {},
                          selectedStyle: theme.textTheme.labelMedium,
                          hintText: dropdownList.first,
                          listItemStyle: theme.textTheme.labelMedium,
                          hintStyle: theme.textTheme.labelMedium,
                          fillColor: Constants.transparentColor,
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          items: dropdownList,
                          controller: dropdownController,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 400,
          child: Placeholder(),
        )
      ],
    );
  }
}
