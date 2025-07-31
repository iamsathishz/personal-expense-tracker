// --- lib/features/transactions/domain/usecases/get_transactions_usecase.dart ---

import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';

import '../entities/transaction_entity.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;
  GetTransactionsUseCase(this.repository);

  Future<List<TransactionEntity>> call() => repository.fetchTransactions();
}
