import 'package:banking_app/providers/bank_provider.dart';
import 'package:banking_app/providers/currency_provider.dart';
import 'package:banking_app/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          gradient: LinearGradient(
              colors: [
                Colors.greenAccent,
                Colors.lightGreenAccent,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Selector<CurrencyProvider, String>(
                    selector: (_, provider) => provider.currency!,
                    builder: (context, currency, child) {
                      return Text(
                        currency == '\$' ? 'Physical / USD' : 'Physical / EURO',
                        style: subtitle,
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Selector<CurrencyProvider, String>(
                    selector: (_, provider) => provider.currency ?? '\$',
                    builder: (context, currency, child) {
                      return Selector<BankProvider, double>(
                        selector: (_, provider) => provider.credit ?? 0.0,
                        builder: (context, credit, child) {
                          return Text(
                            '$currency${credit.toStringAsFixed(2)}',
                            style: heading,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Limit - \$35000',
                    style: subtitle,
                  ),
                  Text(
                    '*5422',
                    style: subtitle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
