import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'history_screen.dart'; // Import halaman History yang sudah kita buat
import '../../core/constants/app_colors.dart';
import '../../providers/nav_provider.dart';
import 'home_screen.dart'; // Import halaman Home yang sudah kita buat
import 'profile_screen.dart'; // Import halaman Profile yang sudah kita buat
import 'my_cards_screen.dart';
import 'scan_screen.dart'; // Import halaman Scan yang sudah kita buat
// Gunakan ConsumerWidget agar bisa membaca data dari Riverpod
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch akan memantau perubahan angka index secara real-time
    final currentIndex = ref.watch(bottomNavProvider);

    // Daftar halaman yang akan ditampilkan berdasarkan index menu yang diklik
    final List<Widget> pages = [
      const HomeScreen(), // Index 0
      const HistoryScreen(),
      const ScanScreen(), // Index 2
      const MyCardsScreen(), // Index 3 (Sementara)
      const ProfileScreen(),
    ];

    return Scaffold(
      // Body akan berubah sesuai halaman yang dipilih di menu bawah
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        // ref.read digunakan untuk MERUBAH data angka index saat menu diklik
        onTap: (index) {
          ref.read(bottomNavProvider.notifier).changeIndex(index);
        },
        type: BottomNavigationBarType
            .fixed, // Agar semua menu muncul (tidak bergeser)
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 16,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_toggle_off),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
