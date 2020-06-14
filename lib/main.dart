import './models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  String title;
  String value;

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
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.amber,
                      width: 2,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tr.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('d/MM/y').format(tr.date),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
          Card(
            elevation: 5,
            child:Padding(
              padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (newValue) => title = newValue,
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  onChanged: (newValue) => value = newValue,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Nova Transação'),
                      textColor: Colors.amber,
                      onPressed: () {
                        print(title);
                        print(value);
                      },
                    ),
                  ],
                )
              ],
            ),
            )
          )
        ],
      ),
    );
  }
}
