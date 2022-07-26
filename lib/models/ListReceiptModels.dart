// To parse this JSON data, do
//
//     final listReceiptModels = listReceiptModelsFromJson(jsonString);

import 'dart:convert';

ListReceiptModels listReceiptModelsFromJson(String str) => ListReceiptModels.fromJson(json.decode(str));

String listReceiptModelsToJson(ListReceiptModels data) => json.encode(data.toJson());

class ListReceiptModels {
  ListReceiptModels({
    this.recipes,
  });

  List<Recipe>? recipes;

  factory ListReceiptModels.fromJson(Map<String, dynamic> json) => ListReceiptModels(
    recipes: json["recipes"] == null ? null : List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recipes": recipes == null ? null : List<dynamic>.from(recipes!.map((x) => x.toJson())),
  };
}

class Recipe {
  Recipe({
    this.id,
    this.picmakanan,
    this.judul,
    this.duration,
    this.source,
    this.information,
  });

  String? id;
  String? picmakanan;
  String? judul;
  String? duration;
  String? source;
  List<String>? information;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"] == null ? null : json["id"],
    picmakanan: json["picmakanan"] == null ? null : json["picmakanan"],
    judul: json["judul"] == null ? null : json["judul"],
    duration: json["duration"] == null ? null : json["duration"],
    source: json["source"] == null ? null : json["source"],
    information: json["information"] == null ? null : List<String>.from(json["information"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "picmakanan": picmakanan == null ? null : picmakanan,
    "judul": judul == null ? null : judul,
    "duration": duration == null ? null : duration,
    "source": source == null ? null : source,
    "information": information == null ? null : List<dynamic>.from(information!.map((x) => x)),
  };
}
