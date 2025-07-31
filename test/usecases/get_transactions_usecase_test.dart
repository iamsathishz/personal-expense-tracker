import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_tracker/core/utils.dart';
import 'package:personal_finance_tracker/domain/entities/transaction_entity.dart';
import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';
import 'package:personal_finance_tracker/domain/usecases/get_transactions_usecase.dart';

class FakeTransactionRepo implements TransactionRepository {
  @override
  Future<List<TransactionEntity>> fetchTransactions() async {
    return [
      TransactionEntity(id: '1', title: 'Test', amount: 100, type: TransactionType.income, date: DateTime.now()),
    ];
  }

  @override
  Future<double> fetchBalance() async => 100.0;

  @override
  Future<TransactionEntity> addTransaction(TransactionEntity transaction) async => transaction;
}

void main() {
  test('should return list of transactions', () async {
    final repo = FakeTransactionRepo();
    final useCase = GetTransactionsUseCase(repo);

    final result = await useCase();

    expect(result, isA<List<TransactionEntity>>());
    expect(result.length, 1);
    expect(result.first.title, 'Test');
  });
}
