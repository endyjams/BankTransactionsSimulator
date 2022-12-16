import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: const TransactionList(),
        appBar: AppBar(
          title: const Text("Transactions"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    ));

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionItem(Transaction('100.0', '100')),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transaction.value),
        subtitle: Text(_transaction.accountNumber),
      ),
    );
  }
}

class Transaction {
  final String value;
  final String accountNumber;

  Transaction(this.value, this.accountNumber);
}
