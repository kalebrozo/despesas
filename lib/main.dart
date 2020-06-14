import './models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: '1',
      title: 'Curso 01',
      value: 12.2,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Curso 02',
      value: 22.3,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Card 01'),
              elevation: 5,
            ),
          ),
         Column(
           children: _transactions.map((tr) {
             return Card (
               child: Text(tr.title)
             );
           }).toList(),
         )
        ],
      ),
    );
  }
}
