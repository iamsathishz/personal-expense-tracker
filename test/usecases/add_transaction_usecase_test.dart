import 'package:flutter_test/flutter_test.dart';
import 'package:personal_finance_tracker/core/utils.dart';
import 'package:personal_finance_tracker/domain/entities/transaction_entity.dart';
import 'package:personal_finance_tracker/domain/usecases/add_transaction_usecase.dart';

import 'get_transactions_usecase_test.dart';

void main() {
  test('should add transaction successfully', () async {
    final repo = FakeTransactionRepo();
    final useCase = AddTransactionUseCase(repo);
    final transaction = TransactionEntity(
      id: '2',
      title: 'Food',
      amount: 50,
      type: TransactionType.expense,
      date: DateTime.now(),
    );

    final result = await useCase(transaction);

    expect(result, isA<TransactionEntity>());
    expect(result.title, 'Food');
  });
}
