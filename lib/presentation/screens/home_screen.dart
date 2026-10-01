import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/transaction_provider.dart';
import '../widgets/home_header.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              const HomeHeader(
                name: 'THE Mochtar',
                imageUrl: 'assets/images/skystore.png',
              ),
              const SizedBox(height: 24),

              const BalanceCard(),
              const SizedBox(height: 32),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  // Menampilkan maksimal 4 transaksi terbaru di Home Screen
                  children: transactions.take(4).map((data) {
                    final dateString =
                        '${data.date.day}/${data.date.month}/${data.date.year}';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: TransactionItem(
                        title: data.title,
                        date: dateString,
                        amount: data.amount,
                        isIncome: data.isIncome,
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
