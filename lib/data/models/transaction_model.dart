import 'package:personal_finance_tracker/core/utils.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
    required super.type,
    required super.date,
  });

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      type: entity.type,
      date: entity.date,
    );
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      type: TransactionType.values.firstWhere((e) => e.name == map['type']),
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'amount': amount,
    'type': type.name,
    'date': date.toIso8601String(),
  };
}
