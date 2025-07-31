import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../../domain/usecases/get_balance_usecase.dart';
import '../../../domain/usecases/get_transactions_usecase.dart';
import '../../../domain/usecases/add_transaction_usecase.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsUseCase getTransactions;
  final GetBalanceUseCase getBalance;
  final AddTransactionUseCase addTransaction;

  TransactionBloc({
    required this.getTransactions,
    required this.getBalance,
    required this.addTransaction,
  }) : super(TransactionLoading()) {
    on<LoadTransactions>((event, emit) async {
      emit(TransactionLoading());
      final transactions = await getTransactions();
      transactions.sort((a, b) => b.date.compareTo(a.date));
      final balance = await getBalance();
      emit(TransactionLoaded(transactions: transactions, balance: balance));
    });

    on<CreateTransaction>((event, emit) async {
      if (state is TransactionLoaded) {
        await addTransaction(event.transaction);
        final transactions = await getTransactions();
        transactions.sort((a, b) => b.date.compareTo(a.date));
        final balance = await getBalance();
        emit(TransactionLoaded(transactions: transactions, balance: balance));
      }
    });
  }
}
