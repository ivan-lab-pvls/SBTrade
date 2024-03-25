import 'package:flutter/material.dart';

import '../app_colors.dart';

class StockTextStyle {
  static TextStyle bannerTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle bannerSubtitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );
  static TextStyle balanceTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGreyColor,
  );
  static const TextStyle balanceAmount = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 20.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blueColor,
  );
  static const TextStyle balanceCount = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blueColor,
  );
  static const TextStyle stockTitle = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18.0,
    height: 18 / 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle stock = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 14.0,
    height: 20 / 18,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );
  static TextStyle price = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 18.0,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle interestPos = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 18.0,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greenColor,
  );
  static TextStyle interestNeg = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 18.0,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.redColor,
  );
}
