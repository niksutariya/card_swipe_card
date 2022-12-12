import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;

  const CustomText({
    Key? key,
    this.title = "",
    this.color,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.textAlign,
    this.decoration,
    this.overflow, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
        decoration: decoration,
      ),
    );
  }
}


