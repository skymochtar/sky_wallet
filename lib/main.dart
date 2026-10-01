import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sky Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // Menggunakan LayoutBuilder untuk mengecek ukuran layar secara real-time
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Scaffold(
                backgroundColor: Colors.grey[200], // Background abu-abu di luar HP
                body: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24), // Sudut melengkung ala HP
                    child: SizedBox(
                      width: 450,
                      height: 900, 
                      child: child, 
                    ),
                  ),
                ),
              );
            }
            
            return child!;
          },
        );
      },
      
      home: const MainScreen(),
    );
  }
}