import 'package:bottom_sheet_scaffold/bottom_sheet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    const unselectedColor = Color.fromRGBO(215, 220, 228, 1);
    const selectedColor = Color.fromRGBO(56, 124, 255, 1);
    return BottomSheetBuilder(builder: (status, context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 58,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 35,
              bottom: 2,
              child: IconButton(
                color: unselectedColor,
                onPressed: () {
                  if (status.isOpened) BottomSheetPanel.close();
                  Provider.of<NavigationProvider>(context, listen: false)
                      .changeNavigation('home');
                },
                icon: Icon(
                  Icons.home_filled,
                  color: Provider.of<NavigationProvider>(context)
                                  .currentNavigation ==
                              'home' &&
                          status.isCollapsed
                      ? selectedColor
                      : unselectedColor,
                  size: 36,
                ),
              ),
            ),
            Positioned(
              right: 35,
              bottom: 2,
              child: IconButton(
                color: unselectedColor,
                onPressed: () {
                  if (status.isOpened) BottomSheetPanel.close();
                  Provider.of<NavigationProvider>(context, listen: false)
                      .changeNavigation('rates');
                },
                icon: Icon(
                  Icons.insert_chart,
                  color: Provider.of<NavigationProvider>(context)
                                  .currentNavigation ==
                              'rates' &&
                          status.isCollapsed
                      ? selectedColor
                      : unselectedColor,
                  size: 36,
                ),
              ),
            ),
            Positioned(
              bottom: 13,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: status.isOpened ? selectedColor : unselectedColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Image.asset('assets/images/arrows_icon.png'),
                  ),
                  onPressed: () {
                    if (BottomSheetPanel.isOpen) {
                      BottomSheetPanel.close();
                    } else {
                      BottomSheetPanel.open();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
