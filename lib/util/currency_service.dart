import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyService {
  final String apiKey = 'e3b3449fb4dccac34175e9b7';
  final String baseUrl = 'https://api.exchangerate-api.com/v4/latest/';

  Future<dynamic> getConversionRates(String baseCurrency) async {
    final response =
        await http.get(Uri.parse('$baseUrl$baseCurrency?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load currency conversion rates');
    }
  }
}
