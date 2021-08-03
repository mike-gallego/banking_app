import 'package:banking_app/providers/bank_provider.dart';
import 'package:banking_app/providers/currency_provider.dart';
import 'package:banking_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CurrencyProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (context) => BankProvider(),
            lazy: false,
          ),
        ],
        child: Dashboard(),
      ),
    );
  }
}
