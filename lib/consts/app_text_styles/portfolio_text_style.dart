import 'package:flutter/material.dart';

import '../app_colors.dart';

class PortfolioTextStyle {
  static const TextStyle eventTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const TextStyle lastEvent = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blueColor,
  );
  static TextStyle stock = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 16.0,
    height: 20 / 18,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGreyColor,
  );
  static TextStyle eventText = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 15.0,
    height: 20 / 18,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );
  static TextStyle subtitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 24 / 20,
    fontWeight: FontWeight.w800,
    color: Colors.white.withOpacity(0.25),
  );
  static TextStyle bannerTitles = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 20 / 18,
    fontWeight: FontWeight.w600,
    color: Colors.white.withOpacity(0.55),
  );
  static const TextStyle date = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    height: 20 / 14,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
  static const TextStyle tileSumIn = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 20.0,
    height: 20 / 18,
    fontWeight: FontWeight.w600,
    color: AppColors.greenColor,
  );
  static const TextStyle tileSumSp = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 20.0,
    height: 20 / 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle tileTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 15.0,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle tileSubitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 12.0,
    height: 20 / 14,
    fontWeight: FontWeight.w300,
    color: Colors.white.withOpacity(0.5),
  );
}
