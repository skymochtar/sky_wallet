import 'package:flutter/material.dart';
import '../../core/format_currency.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final int amount;
  final bool isIncome;

  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0), // Jarak antar box transaksi
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F8), // Warna latar abu-abu 
        borderRadius: BorderRadius.circular(20), // Sudut melengkung 
      ),
      child: Row(
        children: [
          // Ikon Bulat
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isIncome
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.red.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isIncome
                  ? Icons.account_balance_wallet_outlined
                  : Icons.shopping_bag_outlined,
              color: isIncome ? Colors.green : Colors.redAccent,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),

          // Judul dan Tanggal Transaksi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
              ],
            ),
          ),

          // Nominal Transaksi (+ / -)
          Text(
            '${isIncome ? '+' : '-'} ${formatRupiah(amount)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isIncome ? Colors.green : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
