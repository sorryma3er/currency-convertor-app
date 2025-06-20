import 'package:flutter/material.dart';
import 'screens/data_entry_screen.dart';

void main() {
  runApp(const MyConcurrencyConvertor());
}

class MyConcurrencyConvertor extends StatelessWidget {
  const MyConcurrencyConvertor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataEntryScreen(),
    );
  }
}