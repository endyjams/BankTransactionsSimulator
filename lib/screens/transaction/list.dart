import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import 'form.dart';

const _appBarTitle = 'Transactions';

class TransactionList extends StatefulWidget {
  final List<Transaction> _transactions = [];

  TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget._transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final transaction = widget._transactions[index];
          return TransactionItem(transaction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TransactionForm(),
            ),
          ).then(
            (receivedTransaction) =>
                _transactionListUpdate(receivedTransaction),
          );
        },
      ),
    );
  }

  void _transactionListUpdate(receivedTransaction) {
    if (receivedTransaction != null) {
      setState(
        () {
          widget._transactions.add(receivedTransaction);
        },
      );
    }
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  const TransactionItem(this._transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green, size: 45.0,),
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.accountNumber.toString()),
      ),
    );
  }
}
