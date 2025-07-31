import 'package:personal_finance_tracker/domain/repositories/transaction_repository.dart';


class GetBalanceUseCase {
  final TransactionRepository repository;
  GetBalanceUseCase(this.repository);

  Future<double> call() => repository.fetchBalance();
}
