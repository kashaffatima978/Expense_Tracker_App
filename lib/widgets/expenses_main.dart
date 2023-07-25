import 'package:expense_tracker/widgets/add_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';
import './expenses_list.dart';

class ExpensesMain extends StatefulWidget {
  const ExpensesMain({super.key});
  @override
  State<ExpensesMain> createState() {
    return _ExpensesMain();
  }
}

class _ExpensesMain extends State<ExpensesMain> {
  final List<Expense> expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  void openAddScreen() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddExpense(addExp: addNewExpenseInList));
  }

  void addNewExpenseInList(Expense exp) {
    setState(() {
      expenses.add(exp);
    });
  }

  void removeExpense(Expense exp) {
    final index = expenses.indexOf(exp);
    setState(() {
      expenses.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => {
            setState(
              () {
                expenses.insert(index, exp);
              },
            )
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: openAddScreen, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: (expenses.isNotEmpty)
                ? ExpenseList(
                    expenseList: expenses,
                    removeExpense: removeExpense,
                  )
                : const Center(child: Text('No expense yet')),
          ),
        ],
      ),
    );
  }
}
