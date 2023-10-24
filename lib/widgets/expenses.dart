import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expence.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter',
      amount: 999,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'cinema',
      amount: 998,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  _openAddExpenceOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpence(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker '),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
              child: ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: _removeExpense,
          ))
        ],
      ),
    );
  }
}
