import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import 'package:trader_simulator/util/app_routes.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import '../../app/widgets/cash_sq_widget.dart';
import '../../app/widgets/sell_button_widget.dart';
import '../../app/widgets/stock_widget.dart';

class SellScreen extends StatefulWidget {
  final StockModel stock;

  SellScreen({
    required this.stock,
  });

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool canSellStock(StockModel stock) {
    return portfolio.contains(stock);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        titleSpacing: -5,
        title: const Text(
          'Back',
          style: SynopsisTextStyle.back,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: size.width * 0.04,
            height: size.width * 0.04,
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.016),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.stock.name,
                        style: SynopsisTextStyle.screenTitle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sell ${widget.stock.name} stock',
                        style: StockTextStyle.balanceAmount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CashSqWidget(
                  stock: widget.stock,
                ),
                StockWidget(widget.stock)
              ],
            ),
            SellButtonWidget(
              onTap: () async {
                try {
                  if (canSellStock(widget.stock)) {
                    setState(() {
                      sellStock(widget.stock);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You sold the stock'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'You don\'t have this stock in your portfolio'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                } catch (e) {
                  print('Error selling stock: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
