import 'package:flutter/material.dart';

import '../app_colors.dart';

class ProfileTextStyle {
  static TextStyle user = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreyColor,
  );
  static const TextStyle email = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    // color: AppColors.lightGreyColor,
  );
  static TextStyle tile = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreyColor,
  );
  static const TextStyle vs = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    // color: AppColors.lightGreyColor,
  );
}
