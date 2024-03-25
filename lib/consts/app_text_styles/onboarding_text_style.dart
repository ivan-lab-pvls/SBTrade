import 'package:flutter/material.dart';

import '../app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 26.0,
    fontWeight: FontWeight.w800,
    // height: 24.0 / 20.0,
    color: Colors.white,
  );
  static TextStyle description = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    //  height: 20.0 / 11.0,
    color: AppColors.lightGreyColor,
  );
  static const TextStyle screenTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 24.0 / 20.0,
    color: Colors.white,
  );
}
