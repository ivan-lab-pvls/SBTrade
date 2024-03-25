import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';

class SellButtonWidget extends StatelessWidget {
  const SellButtonWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.01,
        left: size.width * 0.01,
        right: size.width * 0.01,
      ),
      child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.06,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.darkGreyColor,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Border radius
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sell',
                  style: OnboardingTextStyle.screenTitle,
                ),
                SvgPicture.asset('assets/icons/up.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
