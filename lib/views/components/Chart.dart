import 'package:coinsense/controllers/expense_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseController = Provider.of<ExpenseController>(context);
    final List<dynamic> transactions = expenseController.allTransactions;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              show: false,
            ),
            backgroundColor: Colors.transparent,
            barGroups: transactions.map((transaction) {
              return BarChartGroupData(
                x: transaction.id,
                barRods: [
                  BarChartRodData(
                    borderRadius: BorderRadius.circular(10),
                    toY: double.parse(transaction.amount.toString()),
                    width: 30,
                    color: Colors.white,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
