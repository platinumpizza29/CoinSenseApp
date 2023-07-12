// ignore_for_file: prefer_const_constructors

import 'package:coinsense/controllers/expense_controller.dart';
import 'package:coinsense/views/add_expense.dart';
import 'package:coinsense/views/components/Chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? auth_Key = prefs.getString("auth_key");
    final user = JwtDecoder.decode(auth_Key!);
    print(user);
  }

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    Provider.of<ExpenseController>(context, listen: false).getAllTransactions();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            child: Text(
              "KE",
              style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.outlined(
              onPressed: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Add_Transaction())),
              icon: Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () =>
              Provider.of<ExpenseController>(context, listen: false)
                  .getAllTransactions(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: MyBarChart(),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "My",
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 40, color: Colors.black)),
                TextSpan(
                    text: " Transactions",
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))
              ])),
              Expanded(
                child: Consumer<ExpenseController>(
                  builder: (context, expenseController, _) {
                    if (expenseController.allTransactions.isEmpty) {
                      // Display a loading indicator or placeholder when data is being fetched
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: expenseController.allTransactions.length,
                        itemBuilder: (context, index) {
                          // Display the data in each list item
                          final reversed = expenseController
                              .allTransactions.reversed
                              .toList();
                          final transaction = reversed[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text(
                                transaction.title,
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                transaction.category,
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                "£" + transaction.amount.toString(),
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
