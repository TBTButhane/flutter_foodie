import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;

  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = Colors.white38,
      this.iconColor,
      this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size! / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
