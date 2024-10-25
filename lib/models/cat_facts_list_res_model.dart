// To parse this JSON data, do
//
//     final catFactsListResModel = catFactsListResModelFromJson(jsonString);

import 'dart:convert';

CatFactsListResModel catFactsListResModelFromJson(String str) =>
    CatFactsListResModel.fromJson(json.decode(str));

class CatFactsListResModel {
  num? currentPage;
  List<Facts>? factsList;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  CatFactsListResModel({
    this.currentPage,
    this.factsList,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory CatFactsListResModel.fromJson(Map<String, dynamic> json) =>
      CatFactsListResModel(
        currentPage: json["current_page"],
        factsList: json["data"] == null
            ? []
            : List<Facts>.from(json["data"]!.map((x) => Facts.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Facts {
  String? fact;
  num? length;

  Facts({
    this.fact,
    this.length,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        fact: json["fact"],
        length: json["length"],
      );
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
