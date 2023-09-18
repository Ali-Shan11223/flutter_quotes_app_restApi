import 'dart:convert';

import 'utils/api_url.dart';
import '../models/quotes_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static Future<List<Quotes>> getAllQuotes() async {
    try {
      var response = await http.get(Uri.parse(APIUrl.allQuotes));
      var temp = <Quotes>[];
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = decodedData['quotes'];
        for (var i in data) {
          Quotes quotes = Quotes.fromJson(i);
          temp.add(quotes);
        }
        return temp;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Quotes> getRandomQuotes() async {
    try {
      var response = await http.get(Uri.parse(APIUrl.randomQuotes));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Quotes.fromJson(data);
      } else {
        throw Exception('Error');
      }
      
    } catch (e) {
      throw e.toString();
    }
  }
}
