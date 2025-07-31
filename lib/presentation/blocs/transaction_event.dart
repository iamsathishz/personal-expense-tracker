part of 'transaction_bloc.dart';

abstract class TransactionEvent {}

class LoadTransactions extends TransactionEvent {}

class CreateTransaction extends TransactionEvent {
  final TransactionEntity transaction;
  CreateTransaction(this.transaction);
}
