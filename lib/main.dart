import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Column(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('haha'),
                subtitle: Text('haha2'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('haha'),
                subtitle: Text('haha2'),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text("Transactions"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    ));
