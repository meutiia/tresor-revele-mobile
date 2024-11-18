// To parse this JSON data, do
//
//     final goodsEntry = goodsEntryFromJson(jsonString);

import 'dart:convert';

List<GoodsEntry> goodsEntryFromJson(String str) => List<GoodsEntry>.from(json.decode(str).map((x) => GoodsEntry.fromJson(x)));

String goodsEntryToJson(List<GoodsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoodsEntry {
    String model;
    String pk;
    Fields fields;

    GoodsEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory GoodsEntry.fromJson(Map<String, dynamic> json) => GoodsEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    String category;
    int condition;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.condition,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        condition: json["condition"],
    );

  get imageUrl => null;

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "condition": condition,
    };
}