// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coinsense/controllers/expense_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Add_Transaction extends StatefulWidget {
  const Add_Transaction({super.key});

  @override
  State<Add_Transaction> createState() => _Add_TransactionState();
}

class _Add_TransactionState extends State<Add_Transaction> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          transitionBetweenRoutes: true,
          trailing: InkWell(
            child: Text(
              "Confirm",
              style:
                  GoogleFonts.spaceGrotesk(color: CupertinoColors.activeBlue),
            ),
            onTap: () => ExpenseController()
                .addNewTransaction(
                    _titleController.text,
                    _categoryController.text,
                    int.parse(_amountController.text),
                    _categoryController.text)
                .whenComplete(() => Navigator.pop(context)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Add",
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 40, color: Colors.black)),
                    TextSpan(text: "\n"),
                    TextSpan(
                        text: "Expense",
                        style: GoogleFonts.spaceGrotesk(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                  ])),
                ),
              ),
              SizedBox(height: 30.0),
              Center(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Amount",
                      labelStyle: GoogleFonts.spaceGrotesk(fontSize: 20)),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: GoogleFonts.spaceGrotesk(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Add spacing between the text fields
                  Expanded(
                    child: TextField(
                      controller: _categoryController,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        labelStyle: GoogleFonts.spaceGrotesk(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
