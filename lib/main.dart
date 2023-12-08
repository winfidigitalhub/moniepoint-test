import 'package:flutter/material.dart';
import 'package:moniepoint_test/app_theme/app_theme.dart';
import 'package:moniepoint_test/screens/calculate_screen.dart';
import 'package:moniepoint_test/screens/calculated_total_screen.dart';
import 'package:moniepoint_test/screens/home/bottom_navigation.dart';
import 'package:moniepoint_test/screens/shipment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Moniepoint Test',
      initialRoute: '/bottomNavHome',
      routes: {
        '/bottomNavHome': (context) => const BottomNavigationPage(),
        '/calculate': (context) => CalculateScreen(),
        '/calculatedTotal': (context) => CalculatedTotalScreen(),
        '/shipment': (context) => ShipmentScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: const BottomNavigationPage(),
    );
  }
}
