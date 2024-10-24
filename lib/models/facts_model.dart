// class FactsModel {
//   String? fact;
//   num? length;

//   FactsModel({this.fact, this.length});
// }

import 'dart:convert';

CatFactResmodel catFactResmodelFromJson(String jsondata) {
  return CatFactResmodel.fromJson(json.decode(jsondata));
}

class CatFactResmodel {
  String? fact;
  int? length;

  CatFactResmodel({
    this.fact,
    this.length,
  });

  factory CatFactResmodel.fromJson(Map<String, dynamic> convertedData) {
    return CatFactResmodel(
      fact: convertedData["fact"],
      length: convertedData["length"],
    );
  }
}
