// --- lib/features/transactions/domain/usecases/add_transaction_usecase.dart ---

import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';

import '../entities/transaction_entity.dart';

class AddTransactionUseCase {
  final TransactionRepository repository;
  AddTransactionUseCase(this.repository);

  Future<TransactionEntity> call(TransactionEntity transaction) =>
      repository.addTransaction(transaction);
}
