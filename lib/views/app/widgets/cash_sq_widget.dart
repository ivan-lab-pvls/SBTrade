import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import 'package:trader_simulator/data/repository/game_logic_repo.dart';
import '../../../consts/app_colors.dart';
import '../../../data/models/stock_model.dart';

class CashSqWidget extends StatelessWidget {
  final StockModel stock;

  CashSqWidget({required this.stock});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int stockCount = 0;
    for (var item in portfolio) {
      if (item.name == stock.name) {
        stockCount++;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.darkGreyColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have',
              style: StockTextStyle.stock,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/portfolio.svg'),
                  SizedBox(
                    width: size.width * 0.005,
                  ),
                  Text(
                    stockCount.toString(),
                    style: StockTextStyle.balanceCount,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    cash.toStringAsFixed(2),
                    style: StockTextStyle.price,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
