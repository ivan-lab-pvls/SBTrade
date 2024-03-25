import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trader_simulator/consts/app_colors.dart';
import 'package:trader_simulator/consts/app_text_styles/stock_text_style.dart';
import 'package:trader_simulator/views/app/widgets/cash_rect_widget.dart';
import 'package:trader_simulator/views/app/widgets/chosen_action_button_widget.dart';
import 'package:trader_simulator/views/app/widgets/stock_widget.dart';
import 'package:trader_simulator/views/stock/widgets/banner_widget.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/stock_model.dart';
import '../../../data/repository/game_logic_repo.dart';
import 'event_details_screen.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  void _handleEventGeneration() {
    setState(() {
      generateRandomEvent();
    });
  }

  void _navigateToStockDetail(StockModel stock) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EventDetailScreen(
                stock: stock,
              )),
    );
  }

  Future<void> _showRulesIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.blackColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'How to play?',
                        style: SynopsisTextStyle.screenTitle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Acquire your first shares. Create an event. '
                        'Read the description. Repeat!',
                        style: StockTextStyle.stock,
                        textAlign: TextAlign.center,
                      ),
                      ChosenActionButton(
                        text: 'Got it!',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );

      await prefs.setBool('isFirstTime', false);
    }
  }

  @override
  void initState() {
    super.initState();
    _showRulesIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
      ),
      body: Container(
        color: AppColors.blackColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CashRectWidget(),
              BannerWidget(
                  imagePath: 'assets/icons/star.png',
                  title: 'Events of the day',
                  subtitle:
                      'Generate stock events to practice\nbuying and selling stocks.',
                  onButtonPressed: _handleEventGeneration),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: stockModelList.length,
                  itemBuilder: (context, index) {
                    StockModel stock = stockModelList[index];
                    return GestureDetector(
                      onTap: () {
                        _navigateToStockDetail(stock);
                      },
                      child: StockWidget(stock),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
