import 'dart:math';

import '../models/event_model.dart';
import '../models/stock_model.dart';

void generateRandomEvent() {
  for (StockModel stock in stockModelList) {
    EventModel event = eventModelList[Random().nextInt(eventModelList.length)];

    if (event.type == EventType.positive) {
      stock.interest = event.interestChange;
    } else {
      stock.interest = event.interestChange;
    }

    stock.price = stock.price * (1 + stock.interest);
    stock.event = event;
  }
}

void buyStock(StockModel stock) {
  if (cash >= stock.price) {
    cash -= stock.price;
    portfolio.add(stock);
  }
}

void sellStock(StockModel stock) {
  if (portfolio.contains(stock)) {
    cash += stock.price;
    portfolio.remove(stock);
  }
}

double cash = 2000.0;
List<StockModel> portfolio = [];
