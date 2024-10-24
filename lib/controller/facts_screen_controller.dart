import 'package:cat_facts_api_sample_integration/models/facts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsScreenController with ChangeNotifier {
  CatFactResmodel? resObj;
  bool isLoading = false;
  Future<void> getFact() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/fact");

    try {
      var respose = await http.get(url);

      if (respose.statusCode == 200) {
        resObj = catFactResmodelFromJson(respose.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
