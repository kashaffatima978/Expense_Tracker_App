import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              child: Row(
                children: [
                  Text('\$ ${expense.amount}'),
                  const Spacer(
                    flex: 2,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(categoryIcon[expense.category]),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(expense.formatDate)
                        ],
                      ),
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
