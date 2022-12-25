import 'package:bank_transactions/screens/transaction/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TransactionApp());

class TransactionApp extends StatelessWidget {
  const TransactionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: TransactionList(),
    );
  }
}
