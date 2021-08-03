import 'package:banking_app/providers/bank_provider.dart';
import 'package:banking_app/providers/currency_provider.dart';
import 'package:banking_app/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.color, this.action, this.icon})
      : super(key: key);

  final Color? color;
  final String? action;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            switch (action) {
              case 'Send':
                Provider.of<BankProvider>(context, listen: false)
                    .openAction(context);
                //Provider.of<BankProvider>(context, listen: false).sendMoney();
                break;
              case 'Request':
                // Provider.of<BankProvider>(context, listen: false)
                //     .requestMoney();
                break;
              case 'Exchange':
                Provider.of<CurrencyProvider>(context, listen: false)
                    .changeCurrency(
                        context,
                        Provider.of<BankProvider>(context, listen: false)
                            .credit!);
                break;
              default:
                break;
            }
          },
          child: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
        ),
        Text(
          '$action',
          style: subtitle,
        )
      ],
    );
  }
}
