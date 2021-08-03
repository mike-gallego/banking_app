import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class BankProvider extends ChangeNotifier {
  BankProvider();

  double? _credit = 200;
  double? get credit => _credit;

  void sendMoney() {
    // Fixed amount = $100
    _credit = _credit! - 100;
    notifyListeners();
  }

  void receiveMoney() {
    // Fixed amount = $100
    _credit = _credit! + 100;
    notifyListeners();
  }

  void setCredit(double credit) {
    _credit = credit;
    notifyListeners();
  }
}
