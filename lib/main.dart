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

  final TextEditingController _controllerAccountNumber = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Transfer'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerAccountNumber,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerValue,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Value',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
              final int? accountNumber = int.tryParse(_controllerAccountNumber.text);
              final double? value = double.tryParse(_controllerValue.text);

              if (accountNumber != null && value != null){
                final newTransaction = Transaction(value, accountNumber);
              }
            },
          )
        ],
      ),
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
          TransactionItem(Transaction(100.0, 1000)),
          TransactionItem(Transaction(200.0, 2000)),
          TransactionItem(Transaction(300.0, 3000)),
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
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.accountNumber.toString()),
      ),
    );
  }
}

class Transaction {
  final double value;
  final int accountNumber;

  Transaction(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transaction{value: $value, accountNumber: $accountNumber}';
  }
}
