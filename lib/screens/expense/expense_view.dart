import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(child: Text('Expense screen'),),
    ));
  }
}
