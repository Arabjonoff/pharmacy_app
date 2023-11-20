// To parse this JSON data, do
//
//     final pagesModel = pagesModelFromJson(jsonString);

import 'dart:convert';

PagesModel pagesModelFromJson(String str) => PagesModel.fromJson(json.decode(str));


class PagesModel {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  PagesModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PagesModel.fromJson(Map<String, dynamic> json) => PagesModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

}

class Result {
  int id;
  String title;
  String body;
  String image;
  String imageUz;
  String url;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  Result({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.imageUz,
    required this.url,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"]??0,
    title: json["title"]??"",
    body: json["body"]??"",
    image: json["image"]??"",
    imageUz: json["image_uz"]??"",
    url: json["url"]??"",
    slug: json["slug"??""],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
