import 'package:flutter/material.dart';

import '../app_colors.dart';

class SynopsisTextStyle {
  static const TextStyle tile = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    height: 20 / 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 26.0,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle appbar = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 24.0,
    height: 24 / 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const TextStyle back = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18.0,
    height: 24 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blueColor,
  );
}
