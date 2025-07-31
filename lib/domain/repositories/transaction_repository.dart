import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> fetchTransactions();
  Future<TransactionEntity> addTransaction(TransactionEntity transaction);
  Future<double> fetchBalance();
}
