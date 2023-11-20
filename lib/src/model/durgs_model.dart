import 'dart:convert';

DrugsModel drugsModelFromJson(String str) => DrugsModel.fromJson(json.decode(str));

class DrugsModel {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  DrugsModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory DrugsModel.fromJson(Map<String, dynamic> json) => DrugsModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

}

class Result {
  int id;
  String name;
  String? barcode;
  String image;
  String? description;
  String imageThumbnail;
  dynamic piece;
  dynamic dose;
  bool status;
  double price;
  double basePrice;
  String slug;
  dynamic expirationDate;
  bool isRecept;
  dynamic unit;
  dynamic internationalName;
  dynamic manufacturer;
  dynamic pharmGroup;
  dynamic category;
  int maxCount;
  bool isComing;
  List<dynamic> remains;
  int similarity;
  List<dynamic> ingredient;
  double rating;

  Result({
    required this.id,
    required this.name,
    required this.barcode,
    required this.image,
    required this.description,
    required this.imageThumbnail,
    required this.piece,
    required this.dose,
    required this.status,
    required this.price,
    required this.basePrice,
    required this.slug,
    required this.expirationDate,
    required this.isRecept,
    required this.unit,
    required this.internationalName,
    required this.manufacturer,
    required this.pharmGroup,
    required this.category,
    required this.maxCount,
    required this.isComing,
    required this.remains,
    required this.similarity,
    required this.ingredient,
    required this.rating,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    barcode: json["barcode"],
    image: json["image"],
    description: json["description"],
    imageThumbnail: json["image_thumbnail"],
    piece: json["piece"],
    dose: json["dose"],
    status: json["status"],
    price: json["price"],
    basePrice: json["base_price"],
    slug: json["slug"],
    expirationDate: json["expiration_date"],
    isRecept: json["is_recept"],
    unit: json["unit"],
    internationalName: json["international_name"],
    manufacturer: json["manufacturer"],
    pharmGroup: json["pharm_group"],
    category: json["category"],
    maxCount: json["max_count"],
    isComing: json["is_coming"],
    remains: List<dynamic>.from(json["remains"].map((x) => x)),
    similarity: json["similarity"],
    ingredient: List<dynamic>.from(json["ingredient"].map((x) => x)),
    rating: json["rating"]?.toDouble(),
  );

}

class Category {
  int id;
  String name;
  String image;
  String slug;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
  );
}


