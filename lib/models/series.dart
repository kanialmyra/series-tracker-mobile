// To parse this JSON data, do
//
//     final series = seriesFromJson(jsonString);

import 'dart:convert';

List<Series> seriesFromJson(String str) => List<Series>.from(json.decode(str).map((x) => Series.fromJson(x)));

String seriesToJson(List<Series> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Series {
    String model;
    int pk;
    Fields fields;

    Series({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Series.fromJson(Map<String, dynamic> json) => Series(
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
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
    };
}