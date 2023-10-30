import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 310,
      date: DateTime.now(),
    ),

  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          _addTransaction,
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
          child: Conteudo()), // o SingleChildScrollView deixa a tela rolável
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column Conteudo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.maxFinite,
          height: 50,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Card(
            child: Text('Olá'),
            elevation: 3,
          ),
        ),
        TransactionList(_transactions),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Minhas Despesas'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
