import 'package:flutter/material.dart';

class ButtonChip extends StatelessWidget {
  final Widget icon;
  final String title;

  const ButtonChip({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                const SizedBox(width: 8),
                icon,
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).shadowColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
