import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsScreenController with ChangeNotifier {
  Future<void> getFact() async {
    final url = Uri.parse("https://catfact.ninja/fact");

    try {
      var respose = await http.get(url);

      if (respose.statusCode == 200) {
        print("data fetched");
        print(respose.body);

        var convertedjson = jsonDecode(respose.body);
        log(convertedjson["fact"].toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
