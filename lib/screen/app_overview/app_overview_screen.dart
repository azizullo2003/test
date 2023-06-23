import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class AppOverviewScreen extends StatefulWidget {
  const AppOverviewScreen({super.key});

  @override
  State<AppOverviewScreen> createState() => _AppOverviewScreenState();
}

class _AppOverviewScreenState extends State<AppOverviewScreen> {
  List images = ['transaction', 'regulation', 'currencies'];
  final PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  double _containerHeight = 140.0;

  void _animateContainer() {
    setState(() {
      _containerHeight = 135.0;
    });

    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        _containerHeight = 140.0;
      });
    });
  }

  @override
  initState() {
    super.initState();
    pageController.addListener(() {
      _currentPage = pageController.page!.toInt();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          pageSnapping: true,
          children: List.generate(3, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'overview${index + 1}Title',
                        style: theme.textTheme.displaySmall,
                      ).tr(),
                      const SizedBox(height: 16),
                      Text(
                        'overview${index + 1}Body',
                        style: theme.textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 40, right: 20, bottom: 20),
                    child: Image.asset(
                      'assets/images/${images[index]}.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35.0),
              child: DotsIndicator(
                dotsCount: (_currentPage > 3) ? 3 : 4,
                position: _currentPage,
                decorator: DotsDecorator(
                  activeColor: Colors
                      .cyanAccent.shade200, // Customize the active dot color
                  color:
                      Colors.grey.shade400, // Customize the inactive dot color
                  size: const Size.square(6.5), // Customize the dot size
                  activeSize:
                      const Size(5.0, 12.0), // Customize the active dot size
                  spacing: const EdgeInsets.all(
                      3.0), // Customize the spacing between dots
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5.0), // Customize the active dot shape
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _animateContainer();
                _currentPage = _currentPage + 1;
                (_currentPage != 3)
                    ? pageController.animateToPage(_currentPage,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn)
                    : Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
              },
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: _containerHeight,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/btn.png',
                        fit: BoxFit.fitWidth,
                      ),
                      const Positioned(
                        top: 20,
                        right: 16,
                        left: 20,
                        bottom: 16,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
