import 'package:banking_app/components/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

enum BankType { CHECKING, SAVINGS }

class BankProvider extends ChangeNotifier {
  BankProvider() {
    getCredits(BankType.CHECKING);
  }

  double? _credit;
  double? get credit => _credit;

  BankType? _bankType = BankType.CHECKING;
  BankType? get bankType => _bankType;

  void openAction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (context) {
        return ActionSheet();
      },
    );
  }

  void getCredits(BankType bankType) {
    if (bankType == BankType.CHECKING) {
      _credit = 1287;
    } else if (bankType == BankType.SAVINGS) {
      _credit = 2500;
    } else {
      _credit = 0;
    }
    notifyListeners();
  }

  void changeBankType(BankType bankType) {
    _bankType = bankType;
    getCredits(_bankType!);
    notifyListeners();
  }

  // void sendMoney() {
  //   // Fixed amount = $100
  //   _credit = _credit! - 100;
  //   notifyListeners();
  // }

  // void requestMoney() {
  //   // Fixed amount = $100
  //   _credit = _credit! + 100;
  //   notifyListeners();
  // }

  void setCredit(double credit) {
    _credit = credit;
    notifyListeners();
  }
}
