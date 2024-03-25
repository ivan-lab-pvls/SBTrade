import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({super.key, required this.onTap});

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
            backgroundColor: AppColors.blueColor,
            padding: const EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Border radius
            ),
          ),
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Buy',
                  style: OnboardingTextStyle.screenTitle,
                ),
                SvgPicture.asset('assets/icons/down.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
