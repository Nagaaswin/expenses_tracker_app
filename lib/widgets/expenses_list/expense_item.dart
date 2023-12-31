import 'package:flutter/material.dart';

import '../../icons/expense_icons.dart';
import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    required this.expense,
    super.key,
    required this.upsertExpenseOverlay,
  });
  final void Function(Expense expense) upsertExpenseOverlay;

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          upsertExpenseOverlay(expense);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}'),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(expense.formattedDate),
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
