import 'package:flutter/material.dart';

void main() => runApp(TransactionApp());

class TransactionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransactionForm(),
      ),
    );
  }
}

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Transfer'),
      ),
      body: Text('Test'),
    );
  }
}

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: Column(
        children: <Widget>[
          TransactionItem(Transaction('100.0', '100')),
          TransactionItem(Transaction('200.0', '200')),
          TransactionItem(Transaction('300.0', '300')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
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
