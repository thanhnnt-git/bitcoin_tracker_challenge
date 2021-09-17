import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'F3FC343D-9C87-4F06-927D-BA06BCCA12E1';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get(Uri.parse(
        '$coinAPIURL/${cryptoList.first}/$selectedCurrency?apikey=$apiKey'));

    if (response.statusCode == 200) {
      var decodedData = convert.jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      return response.statusCode;
    }
  }
}
