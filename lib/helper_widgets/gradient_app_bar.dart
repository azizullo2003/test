import 'package:flutter/material.dart';

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
            Color.fromRGBO(53, 238, 191, 1.0),
            Color.fromRGBO(60, 193, 179, 1)
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 55,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                title,

                style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 12,
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
