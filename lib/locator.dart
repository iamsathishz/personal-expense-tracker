import 'package:get_it/get_it.dart';
import 'package:personal_finance_tracker/data/repositories/transaction_repository_impl.dart';
import 'package:personal_finance_tracker/data/services/transaction_service_impl.dart';
import 'package:personal_finance_tracker/domain/usecases/add_transaction_usecase.dart';
import 'package:personal_finance_tracker/domain/usecases/get_balance_usecase.dart';
import 'package:personal_finance_tracker/domain/usecases/get_transactions_usecase.dart';
import 'package:personal_finance_tracker/presentation/blocs/transaction_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final service = TransactionServiceImpl();
  final repository = TransactionRepositoryImpl(service);

  getIt.registerSingleton<GetTransactionsUseCase>(
    GetTransactionsUseCase(repository),
  );
  getIt.registerSingleton<GetBalanceUseCase>(GetBalanceUseCase(repository));
  getIt.registerSingleton<AddTransactionUseCase>(
    AddTransactionUseCase(repository),
  );
  getIt.registerSingleton<TransactionBloc>(
    TransactionBloc(
      getTransactions: getIt<GetTransactionsUseCase>(),
      getBalance: getIt<GetBalanceUseCase>(),
      addTransaction: getIt<AddTransactionUseCase>(),
    ),
  );
}
