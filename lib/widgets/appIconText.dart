import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? iconSize;
  final double? fontSize;
  final Color? iconColr;
  final Color? fontColr;

  const AppIconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconSize,
      this.fontSize,
      this.iconColr,
      this.fontColr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(icon, size: iconSize, color: iconColr),
          SizedBox(width: 3),
          Text(text,
              style: GoogleFonts.roboto(color: fontColr, fontSize: fontSize))
        ],
      ),
    );
  }
}
