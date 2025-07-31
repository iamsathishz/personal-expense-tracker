import '../models/transaction_model.dart';
import 'dart:async';
import 'package:personal_finance_tracker/core/utils.dart';

class TransactionServiceImpl {
  final List<TransactionModel> _transactions = [
    for (var entity in mockTransactions) TransactionModel.fromEntity(entity),
  ];

  Future<List<TransactionModel>> fetchTransactions() async {
    await Future.delayed(const Duration(seconds: 1));
    return _transactions;
  }

  Future<TransactionModel> addTransaction(TransactionModel transaction) async {
    await Future.delayed(const Duration(seconds: 1));
    _transactions.add(transaction);
    return transaction;
  }

  Future<double> fetchBalance() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _transactions.fold<double>(0.0, (sum, t) {
      return t.type == TransactionType.income ? sum + t.amount : sum - t.amount;
    });
  }
}
