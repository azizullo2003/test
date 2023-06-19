import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double? height;
  final Widget? actions;
  final Widget? leading;
  final Widget? content;

  const GradientAppBar({
    super.key,
    required this.title,
    this.height,
    this.actions,
    this.leading,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      height: height == null ? size.height * 0.10 : height!,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(32, 241, 192, 1),
            Color.fromRGBO(60, 193, 179, 1)
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                title,
                style: theme.textTheme.labelLarge,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            child: actions == null ? const SizedBox.shrink() : actions!,
          ),
          Positioned(
            top: 30,
            left: 5,
            child: leading == null ? const SizedBox.shrink() : leading!,
          ),
          if (content != null)
            Positioned(
              top: 80,
              right: 10,
              left: 10,
              bottom: 10,
              child: content!,
            )
        ],
      ),
    );
  }
}
