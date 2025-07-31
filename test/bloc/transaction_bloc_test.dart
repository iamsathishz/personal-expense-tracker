import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:personal_finance_tracker/domain/usecases/add_transaction_usecase.dart';
import 'package:personal_finance_tracker/domain/usecases/get_balance_usecase.dart';
import 'package:personal_finance_tracker/domain/usecases/get_transactions_usecase.dart';
import 'package:personal_finance_tracker/presentation/blocs/transaction_bloc.dart';

import '../usecases/get_transactions_usecase_test.dart';

void main() {
  blocTest<TransactionBloc, TransactionState>(
    'emits [TransactionLoading, TransactionLoaded] when LoadTransactions is added',
    build: () => TransactionBloc(
      getTransactions: GetTransactionsUseCase(FakeTransactionRepo()),
      getBalance: GetBalanceUseCase(FakeTransactionRepo()),
      addTransaction: AddTransactionUseCase(FakeTransactionRepo()),
    ),
    act: (bloc) => bloc.add(LoadTransactions()),
    expect: () => [isA<TransactionLoading>(), isA<TransactionLoaded>()],
  );
}
