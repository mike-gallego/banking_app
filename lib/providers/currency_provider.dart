import 'package:banking_app/providers/bank_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrencyProvider extends ChangeNotifier {
  CurrencyProvider();

  // Given that 1 EURO is 1.19 USD
  // Given that 1 USD is 0.84 EURO
  String? _currency = '\$';
  String? get currency => _currency;

  void changeCurrency(BuildContext context, double credit) {
    if (_currency! == '\$') {
      _currency = '\€';
      Provider.of<BankProvider>(context, listen: false)
          .setCredit(credit * 1.1737166);
    } else {
      Provider.of<BankProvider>(context, listen: false)
          .setCredit(credit * 0.851994);
      _currency = '\$';
    }
    notifyListeners();
  }
}
