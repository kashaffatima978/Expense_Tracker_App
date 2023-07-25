import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expense_item.dart';
import '../models/expense_model.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenseList, required this.removeExpense});
  final List<Expense> expenseList;
  final void Function(Expense exp) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) {
        return Dismissible(
            background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.5)),
            onDismissed: (direction) => removeExpense(expenseList[index]),
            key: ValueKey(expenseList[index]),
            child: ExpenseItem(expenseList[index]));
      },
    );
  }
}
