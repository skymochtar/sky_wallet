import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/transaction_provider.dart';
import '../widgets/transaction_item.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: transactions.isEmpty
            ? const Center(
                child: Text(
                  'Belum ada transaksi',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            : ListView(
                children: [
                  const Text(
                    'All Transactions',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Menampilkan daftar transaksi secara dinamis dari provider
                  ...transactions.map((data) {
                    // Format tanggal sederhana
                    final dateString =
                        '${data.date.day}/${data.date.month}/${data.date.year}';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TransactionItem(
                        title: data.title,
                        date: dateString,
                        amount: data.amount,
                        isIncome: data.isIncome,
                      ),
                    );
                  }),
                ],
              ),
      ),
    );
  }
}