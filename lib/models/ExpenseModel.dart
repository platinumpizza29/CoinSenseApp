// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

List<ExpenseModel> expenseModelFromJson(String str) => List<ExpenseModel>.from(
    json.decode(str).map((x) => ExpenseModel.fromJson(x)));

String expenseModelToJson(List<ExpenseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseModel {
  int id;
  String title;
  String description;
  int amount;
  String category;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "amount": amount,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
      };
}
