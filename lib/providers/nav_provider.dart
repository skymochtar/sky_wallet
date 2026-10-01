import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() {
    return 0; 
  }

  // Fungsi untuk mengubah halaman saat menu diklik
  void changeIndex(int newIndex) {
    state = newIndex; 
  }
}

final bottomNavProvider = NotifierProvider<BottomNavNotifier, int>(() {
  return BottomNavNotifier();
});