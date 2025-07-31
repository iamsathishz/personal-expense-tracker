import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_tracker/presentation/blocs/transaction_bloc.dart';
import 'package:personal_finance_tracker/presentation/screens/add_transaction_screen.dart';
import 'package:personal_finance_tracker/presentation/widgets/balance_card.dart';
import 'package:personal_finance_tracker/presentation/widgets/section_header.dart';
import 'package:personal_finance_tracker/presentation/widgets/transaction_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '💰 Finance Tracker',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BalanceCard(balance: state.balance),
                SectionHeader(title: 'Recent Transactions'),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.transactions.length,
                    itemBuilder: (_, i) =>
                        TransactionCard(transaction: state.transactions[i]),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionPage()),
          );
          if (result == true) {
            context.read<TransactionBloc>().add(LoadTransactions());
          }
        },
        label: const Text('Add Transaction'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
