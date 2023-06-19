import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';
import '../deposit/deposit_screen.dart';
import '../home/home_screen.dart';
import '../rates/rates_screen.dart';
import '../withdraw/withdraw_screen.dart';
import 'bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return BottomSheetScaffold(
      bottomNavigationBar: const BottomBar(),
      bottomSheet: DraggableBottomSheet(
        gradientOpacity: false,
        maxHeight: 150,
        animationDuration: const Duration(milliseconds: 200),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WithdrawScreen(),
                      ),
                    );
                  },
                  leading: Image.asset(
                    'assets/images/withdraw.png',
                    height: 30,
                  ),
                  title: Text(
                    'withdraw',
                    style: theme.textTheme.titleMedium,
                  ).tr(),
                ),
                SizedBox(
                  width: size.width * 0.9,
                  child: const Divider(),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DepositScreen(),
                      ),
                    );
                  },
                  leading: Image.asset(
                    'assets/images/deposit.png',
                    height: 30,
                  ),
                  title: Text(
                    'deposit',
                    style: theme.textTheme.titleMedium,
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BarrierViewer(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: switch (
              Provider.of<NavigationProvider>(context).currentNavigation) {
            'home' => const HomeScreen(),
            'rates' => const RatesScreen(),
            _ => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
