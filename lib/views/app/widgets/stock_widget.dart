import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_simulator/consts/app_colors.dart';

import '../../../consts/app_text_styles/stock_text_style.dart';
import '../../../data/models/stock_model.dart';

class StockWidget extends StatelessWidget {
  final StockModel stock;

  StockWidget(this.stock);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            Row(
              children: [
                SvgPicture.asset(
                  stock.icon,
                  width: size.width * 0.085,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    stock.name,
                    style: StockTextStyle.stockTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'Stocks',
              style: StockTextStyle.stock,
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${stock.price.toStringAsFixed(2)}',
                  style: StockTextStyle.price,
                ),
                Text(
                  '${stock.interest}%',
                  style: stock.interest >= 0
                      ? StockTextStyle.interestPos
                      : StockTextStyle.interestNeg,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
