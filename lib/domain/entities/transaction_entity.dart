import 'package:personal_finance_tracker/core/utils.dart';

class TransactionEntity {
  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final DateTime date;

  TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });
}
