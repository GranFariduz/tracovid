import 'package:http/http.dart';
import 'dart:convert';

import 'package:tracovid/constants.dart';

class Network {
  Future<List> getData() async {
    try {
      Response response = await get(kAPIURL);
      if (response.statusCode == 200) {
        List<dynamic> covidData = jsonDecode(response.body);
        return covidData;
      }
    } catch (err) {
      print(err);
    }
  }
}
