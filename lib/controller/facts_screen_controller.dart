import 'dart:convert';
import 'dart:developer';

import 'package:cat_facts_api_sample_integration/models/facts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsScreenController with ChangeNotifier {
  FactsModel? resObj;
  bool isLoading = false;
  Future<void> getFact() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/fact");

    try {
      var respose = await http.get(url);

      if (respose.statusCode == 200) {
        print("data fetched");
        print(respose.body);

        var convertedjson = jsonDecode(respose.body);

        resObj = FactsModel(
          fact: convertedjson["fact"],
          length: convertedjson["length"],
        );
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
