import 'event_model.dart';

class StockModel {
  String icon;
  String name;
  double price;
  double interest;
  EventModel? event;

  StockModel({
    required this.icon,
    required this.name,
    required this.price,
    this.interest = 0.0,
    this.event,
  });
}

List<StockModel> stockModelList = [
  StockModel(icon: 'assets/icons/energy.svg', name: 'Energy', price: 100.0),
  StockModel(icon: 'assets/icons/health.svg', name: 'Health', price: 150.0),
  StockModel(
      icon: 'assets/icons/production.svg', name: 'Production', price: 80.0),
  StockModel(icon: 'assets/icons/retail.svg', name: 'Retail', price: 60.0),
  StockModel(
      icon: 'assets/icons/technical.svg', name: 'Technical', price: 120.0),
  StockModel(
      icon: 'assets/icons/transportation.svg',
      name: 'Transportation',
      price: 43.0),
  StockModel(
      icon: 'assets/icons/tv.svg', name: 'Telecommunication', price: 95.0),
];
