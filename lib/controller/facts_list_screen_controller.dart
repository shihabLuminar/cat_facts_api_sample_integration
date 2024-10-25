import 'dart:developer';

import 'package:cat_facts_api_sample_integration/models/cat_facts_list_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsListScreenController with ChangeNotifier {
  List<Facts> factsList = [];

  Future<void> getFactsList() async {
    final url = Uri.parse("https://catfact.ninja/facts");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        CatFactsListResModel resModel =
            catFactsListResModelFromJson(response.body);

        factsList = resModel.factsList ?? [];
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
