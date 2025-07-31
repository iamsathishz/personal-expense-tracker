import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_tracker/locator.dart';
import 'package:personal_finance_tracker/presentation/blocs/transaction_bloc.dart';
import 'package:personal_finance_tracker/presentation/screens/dashboard_screen.dart';

void main() {
  setupDependencies();
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (_) => getIt<TransactionBloc>()..add(LoadTransactions()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance Tracker',
        home: const DashboardPage(),
      ),
    );
  }
}
