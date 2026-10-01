import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          
          // 1. Area Kartu yang bisa digeser (PageView)
          SizedBox(
            height: 220, // Tinggi area kartu
            // PageView memungkinkan kita menggeser anak-anaknya ke kiri/kanan
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: PageController(viewportFraction: 0.9), // Agar kartu sebelah terlihat sedikit
              children: [
                _buildCreditCard(
                  bankName: 'SKY BANK',
                  cardNumber: '**** **** **** 1234',
                  cardHolder: 'SKY MOCHTAR',
                  expiryDate: '12/28',
                  color1: const Color(0xFF1E3A8A), // Biru tua
                  color2: const Color(0xFF3B82F6), // Biru terang
                ),
                _buildCreditCard(
                  bankName: 'SKY PREMIER',
                  cardNumber: '**** **** **** 9876',
                  cardHolder: 'SKY MOCHTAR',
                  expiryDate: '08/27',
                  color1: const Color(0xFF0F172A), // Hitam pekat
                  color2: const Color(0xFF475569), // Abu-abu
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // 2. Tombol Tambah Kartu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: AppColors.primary),
              label: const Text(
                'Add New Card',
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                side: const BorderSide(color: AppColors.primary, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard({
    required String bankName,
    required String cardNumber,
    required String cardHolder,
    required String expiryDate,
    required Color color1,
    required Color color2,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // LinearGradient memberikan efek percampuran dua warna yang mulus
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2],
        ),
        boxShadow: [
          BoxShadow(
            color: color2.withValues(alpha: 0.4),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Baris Atas: Nama Bank & Chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bankName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const Icon(Icons.contactless_outlined, color: Colors.white, size: 28),
            ],
          ),
          
          // Tengah: Nomor Kartu
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
            ),
          ),
          
          // Bawah: Nama Pemilik & Masa Berlaku
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Holder',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                  Text(
                    cardHolder,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Expires',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                  Text(
                    expiryDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}