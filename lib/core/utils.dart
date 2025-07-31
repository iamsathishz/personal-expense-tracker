import '../../../domain/entities/transaction_entity.dart';

enum TransactionType { income, expense }

final List<TransactionEntity> mockTransactions = [
  TransactionEntity(
    id: '1',
    title: 'Grocery Shopping',
    amount: 1250.75,
    type: TransactionType.expense,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  TransactionEntity(
    id: '2',
    title: 'Salary',
    amount: 30000.00,
    type: TransactionType.income,
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
  TransactionEntity(
    id: '3',
    title: 'Electricity Bill',
    amount: 1450.00,
    type: TransactionType.expense,
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
  TransactionEntity(
    id: '4',
    title: 'Part time Job',
    amount: 5000.00,
    type: TransactionType.income,
    date: DateTime.now().subtract(const Duration(days: 8)),
  ),
  TransactionEntity(
    id: '5',
    title: 'Movie Tickets',
    amount: 600.00,
    type: TransactionType.expense,
    date: DateTime.now().subtract(const Duration(days: 10)),
  ),
];
