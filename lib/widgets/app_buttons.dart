import 'package:cubit_example/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  String text;
  IconData? icon;
  bool isIcon;

  AppButtons({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
    this.text = "",
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Center(
        child: isIcon
            ? Icon(
                icon,
                color: color,
              )
            : AppText(
                text: text,
                color: color,
              ),
      ),
    );
  }
}
