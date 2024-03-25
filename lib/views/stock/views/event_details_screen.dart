import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trader_simulator/consts/app_colors.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import 'package:trader_simulator/views/app/widgets/buy_button_widget.dart';
import 'package:trader_simulator/views/app/widgets/cash_sq_widget.dart';
import 'package:trader_simulator/views/app/widgets/stock_widget.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/stock_model.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/sell_button_widget.dart';
import '../widgets/event_widget.dart';

class EventDetailScreen extends StatefulWidget {
  final StockModel stock;
  EventDetailScreen({
    required this.stock,
  });

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
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
            Navigator.of(context).pop();
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
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.035),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.stock.name,
                    style: SynopsisTextStyle.screenTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CashSqWidget(stock: widget.stock),
                StockWidget(widget.stock)
              ],
            ),
            if (widget.stock.event != null)
              SizedBox(
                height: size.height * 0.25,
                child: EventWidget(widget.stock.event!),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                child: Text(
                  "No event currently, try to generate one",
                  style: StockTextStyle.stock,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SellButtonWidget(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.sell,
                      arguments: widget.stock,
                    );
                  },
                ),
                BuyButtonWidget(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.buy,
                      arguments: widget.stock,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
