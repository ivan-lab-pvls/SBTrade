import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/data/repository/game_logic_repo.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/stock_text_style.dart';

class CashRectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.darkGreyColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('You have', style: StockTextStyle.balanceTitle),
            Spacer(),
            SvgPicture.asset(
              'assets/icons/portfolio.svg',
              color: AppColors.blueColor,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(portfolio.length.toString(),
                style: StockTextStyle.balanceCount),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(cash.toStringAsFixed(2), style: StockTextStyle.balanceTitle),
          ],
        ),
      ),
    );
  }
}
