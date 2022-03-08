import 'package:cubit_example/constants/colors.dart';
import 'package:cubit_example/widgets/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final String text;

  const ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width = 120,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            if (isResponsive)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppText(
                  text: text,
                  color: Colors.white,
                ),
              ),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
