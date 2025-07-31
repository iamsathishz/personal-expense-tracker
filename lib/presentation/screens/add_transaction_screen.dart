import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_tracker/presentation/blocs/transaction_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/transaction_entity.dart';
import 'package:personal_finance_tracker/core/utils.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  TransactionType _type = TransactionType.income;
  DateTime _selectedDate = DateTime.now();

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  void _handleSubmit() {
    if (!_isFormValid()) return;

    final tx = TransactionEntity(
      id: const Uuid().v4(),
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text),
      type: _type,
      date: _selectedDate,
    );

    context.read<TransactionBloc>().add(CreateTransaction(tx));
    Navigator.pop(context, true);
  }

  void _handleDatePick() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTitleField(),
              const SizedBox(height: 16),
              _buildAmountField(),
              const SizedBox(height: 16),
              _buildTypeSelector(),
              const SizedBox(height: 16),
              _buildDatePicker(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: const Text(
        'Add Transaction',
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.title),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (val) =>
          val == null || val.trim().isEmpty ? 'Title is required' : null,
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]{0,2}')),
      ],
      decoration: InputDecoration(
        labelText: 'Amount',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.attach_money),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (val) {
        final n = double.tryParse(val ?? '');
        return (n == null || n <= 0) ? 'Enter a valid positive number' : null;
      },
    );
  }

  Widget _buildTypeSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RadioListTile<TransactionType>(
              title: const Text('Income'),
              value: TransactionType.income,
              groupValue: _type,
              onChanged: (val) =>
                  val != null ? setState(() => _type = val) : null,
            ),
          ),
          Expanded(
            child: RadioListTile<TransactionType>(
              title: const Text('Expense'),
              value: TransactionType.expense,
              groupValue: _type,
              onChanged: (val) =>
                  val != null ? setState(() => _type = val) : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Colors.blueAccent),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: _handleDatePick,
      icon: const Icon(Icons.calendar_today),
      label: Text(
        'Pick Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: _handleSubmit,
      child: const Text(
        'Save Transaction',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
