import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import '../../../consts/app_colors.dart';
import '../../app/widgets/chosen_action_button_widget.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onButtonPressed;

  const BannerWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.blueColor.withOpacity(0.14),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imagePath),
                    SizedBox(width: size.width * 0.005),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: StockTextStyle.bannerTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4.0),
                        SizedBox(
                          width: size.width * 0.65,
                          child: Text(
                            subtitle,
                            style: StockTextStyle.bannerSubtitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ChosenActionButton(
                onTap: onButtonPressed,
                text: 'Generate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
