part of 'transaction_bloc.dart';

abstract class TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionEntity> transactions;
  final double balance;

  TransactionLoaded({required this.transactions, required this.balance});
}
