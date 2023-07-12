import 'package:coinsense/models/ExpenseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExpenseController with ChangeNotifier {
  List<ExpenseModel> _allTransactions = [];

  List<ExpenseModel> get allTransactions => _allTransactions;

  getAllTransactions() async {
    var path = "http://192.168.1.137:3000/1/expenses";
    var response = await Dio().get(path);
    print(response.data);
    if (response.statusCode == 200) {
      _allTransactions = (response.data as List)
          .map((e) => ExpenseModel.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addNewTransaction(
      String title, String description, int amount, String category) async {
    var path = "http://192.168.1.137:3000/1/expenses";
    var response = await Dio().post(path, data: {
      "title": title,
      "description": description,
      "amount": amount,
      "category": category
    });
    print(response.data);
  }
}
