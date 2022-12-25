import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transaction.dart';

const appBarTitle = 'Creating Transaction';

const _labelValue = 'Value';
const _hintValue = '0.00';

const _accountNumberHint = '0000';
const _accountNumberLabel = 'Account Number';

const _confirmButtonText = 'Confirm';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

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
        title: const Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerAccountNumber,
              hint: _accountNumberHint,
              label: _accountNumberLabel,
            ),
            Editor(
              controller: _controllerValue,
              hint: _hintValue,
              label: _labelValue,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(_confirmButtonText),
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
      Navigator.pop(context, newTransaction);
    }
  }
}
