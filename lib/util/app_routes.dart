import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trader_simulator/data/models/stock_model.dart';
import 'package:trader_simulator/views/portfolio/views/buy_screen.dart';
import 'package:trader_simulator/views/portfolio/views/sell_screen.dart';
import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/models/news_model.dart';
import '../data/repository/onboarding_repo.dart';
import '../views/app/views/home_screen.dart';
import '../views/news/views/article_screen.dart';
import '../views/onboarding/view/onboarding_screen.dart';
import '../views/settings/views/settings_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const sell = 'sell';
  static const buy = 'buy';
  static const operation = 'operation';
  static const article = 'article';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = const HomeScreen();
      case sell:
        StockModel stock = settings.arguments as StockModel;
        child = SellScreen(stock: stock);
      case buy:
        StockModel stock = settings.arguments as StockModel;
        child = BuyScreen(stock: stock);
      case article:
        NewsModel news = settings.arguments as NewsModel;
        child = ArticleScreen(
          newsModel: news,
        );
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
