import 'package:flutter/material.dart';

void main() => runApp(TransactionApp());

class TransactionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionList(),
    );
  }
}

class TransactionForm extends StatefulWidget {
  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerAccountNumber,
              hint: '0000',
              label: 'Account Number',
            ),
            Editor(
              controller: _controllerValue,
              hint: '0.00',
              label: 'Value',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () => _createTransaction(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerAccountNumber.text);
    final double? value = double.tryParse(_controllerValue.text);

    if (accountNumber != null && value != null) {
      final newTransaction = Transaction(value, accountNumber);
      debugPrint('Creating Transaction');
      debugPrint('$newTransaction');
      Navigator.pop(context, newTransaction);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransactionList extends StatefulWidget {
  final List<Transaction> _transactions = [];

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: ListView.builder(
        itemCount: widget._transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final transaction = widget._transactions[index];
          return TransactionItem(transaction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransactionForm();
          }));
          future.then(
            (receivedTransaction) {
              Future.delayed(Duration(seconds: 1), () {
                debugPrint('got on future then');
                debugPrint('$receivedTransaction');
                if (receivedTransaction != null) {
                  setState(() {
                    widget._transactions.add(receivedTransaction);
                  });
                }
              });
            },
          );
        },
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
