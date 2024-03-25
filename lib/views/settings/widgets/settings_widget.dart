import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_text_styles/synopsis_text_style.dart';

import '../../../consts/app_colors.dart';

class SettingsTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String assetName;

  const SettingsTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
              child: SvgPicture.asset(assetName),
            ),
            Text(text, style: SynopsisTextStyle.tile),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.015),
              child: SvgPicture.asset(
                'assets/icons/arrow.svg',
                width: 14.0,
                height: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
