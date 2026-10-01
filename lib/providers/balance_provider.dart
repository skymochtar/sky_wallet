import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final balanceProvider = NotifierProvider<BalanceNotifier, int>(() {
  return BalanceNotifier();
});

class BalanceNotifier extends Notifier<int> {
  static const _balanceKey = 'sky_wallet_balance';

  @override
  int build() {
    _loadBalance();
    return 0; // Saldo awal sementara
  }

  Future<void> _loadBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBalance = prefs.getInt(_balanceKey) ?? 150000;
    state = savedBalance;
  }

  Future<void> topUp(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final newBalance = state + amount;

    await prefs.setInt(_balanceKey, newBalance);
    state = newBalance;
  }

  Future<void> withdraw(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final newBalance = state - amount;
    await prefs.setInt(_balanceKey, newBalance);
    state = newBalance;
  }
}
