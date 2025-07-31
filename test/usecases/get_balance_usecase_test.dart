import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_tracker/domain/entities/transaction_entity.dart';
import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';
import 'package:personal_finance_tracker/domain/usecases/get_balance_usecase.dart';
import 'package:personal_finance_tracker/core/utils.dart';

class MockTransactionRepository implements TransactionRepository {
  final List<TransactionEntity> transactions;

  MockTransactionRepository(this.transactions);
  @override
  Future<double> fetchBalance() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return transactions.fold<double>(0.0, (sum, t) {
      return t.type == TransactionType.income ? sum + t.amount : sum - t.amount;
    });
  }

  @override
  Future<List<TransactionEntity>> fetchTransactions() async => transactions;

  @override
  Future<TransactionEntity> addTransaction(
    TransactionEntity transaction,
  ) async => transaction;
}

void main() {
  test(
    'returns net balance after applying income and expense transactions',
    () async {
      final mockTransactions = [
        TransactionEntity(
          id: '1',
          title: 'Salary',
          amount: 1000,
          type: TransactionType.income,
          date: DateTime.now(),
        ),
        TransactionEntity(
          id: '2',
          title: 'Groceries',
          amount: 200,
          type: TransactionType.expense,
          date: DateTime.now(),
        ),
      ];

      final repo = MockTransactionRepository(mockTransactions);
      final usecase = GetBalanceUseCase(repo);

      final balance = await usecase();

      expect(balance, 800);
      expect(balance, isA<double>());
    },
  );
}
