import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionData {
  final String title;
  final int amount;
  final DateTime date;
  final bool isIncome;

  TransactionData({
    required this.title,
    required this.amount,
    required this.date,
    required this.isIncome,
  });
}

class TransactionNotifier extends Notifier<List<TransactionData>> {
  @override
  List<TransactionData> build() {
    return [
      TransactionData(
        title: 'Freelance Salary',
        amount: 4500000,
        date: DateTime.now().subtract(const Duration(days: 1)),
        isIncome: true,
      ),
      TransactionData(
        title: 'Starbucks Coffee',
        amount: 80000,
        date: DateTime.now().subtract(const Duration(hours: 2)),
        isIncome: false,
      ),
    ];
  }

  // Menambah transaksi baru ke history teratas
  void addTransaction(String title, int amount, bool isIncome) {
    final newTransaction = TransactionData(
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );
    state = [newTransaction, ...state];
  }
}

final transactionProvider =
    NotifierProvider<TransactionNotifier, List<TransactionData>>(() {
      return TransactionNotifier();
    });
