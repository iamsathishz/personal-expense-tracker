import 'package:personal_finance_tracker/data/models/transaction_model.dart';
import 'package:personal_finance_tracker/data/services/transaction_service_impl.dart';
import 'package:personal_finance_tracker/domain/entities/transaction_entity.dart';
import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionServiceImpl service;

  TransactionRepositoryImpl(this.service);

  @override
  Future<List<TransactionEntity>> fetchTransactions() {
    return service.fetchTransactions();
  }

  @override
  Future<TransactionEntity> addTransaction(TransactionEntity transaction) {
    final model = TransactionModel.fromEntity(transaction);
    return service.addTransaction(model);
  }

  @override
  Future<double> fetchBalance() {
    return service.fetchBalance();
  }
}
