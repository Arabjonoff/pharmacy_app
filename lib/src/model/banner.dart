// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));
class BannerModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  BannerModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );
}

class Result {
  int id;
  String name;
  String image;
  String description;
  int drug;
  dynamic category;
  bool status;
  List<int> drugs;
  int order;
  String drugSlug;
  List<String> drugsSlug;
  dynamic url;

  Result({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.drug,
    required this.category,
    required this.status,
    required this.drugs,
    required this.order,
    required this.drugSlug,
    required this.drugsSlug,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(
        id: json["id"]??0,
        name: json["name"]??"",
        image: json["image"]??"",
        description: json["description"]??"",
        drug: json["drug"]??0,
        category: json["category"]??0,
        status: json["status"],
        drugs: json["drugs"] == null?<int>[]:List<int>.from(json["drugs"].map((x) => x)),
        order: json["order"]??0,
        drugSlug: json["drug_slug"]??"",
        drugsSlug: json["drugs_slug"] == null?<String>[]:List<String>.from(json["drugs_slug"].map((x) => x)),
        url: json["url"]??'',
      );
}

