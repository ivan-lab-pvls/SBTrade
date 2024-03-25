import 'package:flutter/material.dart';
import 'package:trader_simulator/consts/app_colors.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import 'package:trader_simulator/consts/app_text_styles/synopsis_text_style.dart';
import '../../../consts/app_text_styles/portfolio_text_style.dart';
import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import '../../app/widgets/cash_rect_widget.dart';
import '../../app/widgets/stock_widget.dart';
import '../../stock/views/event_details_screen.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  void _navigateToStockDetail(StockModel stock) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EventDetailScreen(
                stock: stock,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
        ),
        body: Container(
          color: AppColors.blackColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.011),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Investment portfolio',
                        style: SynopsisTextStyle.screenTitle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CashRectWidget(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.011),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Shares purchased',
                        style: PortfolioTextStyle.stock,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                portfolio.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: portfolio.toSet().length,
                          itemBuilder: (context, index) {
                            StockModel stock =
                                portfolio.toSet().elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                _navigateToStockDetail(stock);
                              },
                              child: StockWidget(stock),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: Text(
                            'You need to buy stocks to see them in your portfolio.',
                            textAlign: TextAlign.center,
                            style: StockTextStyle.stock,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
