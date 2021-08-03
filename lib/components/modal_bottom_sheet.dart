import 'package:banking_app/components/submit_button.dart';
import 'package:banking_app/providers/bank_provider.dart';
import 'package:banking_app/providers/color_provider.dart';
import 'package:banking_app/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BankProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => ColorProvider(), lazy: false),
      ],
      builder: (context, widget) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.arrow_back_ios),
                    Text('Return', style: subtitle)
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Account', style: heading),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Selector<BankProvider, BankType>(
                  selector: (_, provider) => provider.bankType!,
                  builder: (context, bankType, child) {
                    return DropdownButton<BankType>(
                      value: bankType,
                      elevation: 5,
                      isExpanded: true,
                      itemHeight: 50,
                      onChanged: (newValue) {
                        Provider.of<BankProvider>(context, listen: false)
                            .changeBankType(newValue!);
                      },
                      items: [
                        DropdownMenuItem<BankType>(
                          value: BankType.CHECKING,
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wells Fargo // Checking // 1234...890',
                                  style: subtitle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        DropdownMenuItem<BankType>(
                          value: BankType.SAVINGS,
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chase Bank // Savings // 1234...890',
                                  style: subtitle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Available Credits', style: heading),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Selector<BankProvider, double>(
                      selector: (_, provider) => provider.credit!,
                      builder: (context, credit, child) {
                        return Text('\$${credit.toStringAsFixed(2)}',
                            style: subtitle);
                      },
                    ),
                    Text('USD', style: title)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Available Contacts', style: heading),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  children: List.generate(
                    8,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        shadowColor: Colors.grey[200],
                        backgroundColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .getColor(),
                        label: Text('Bob'),
                        avatar: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/placeholders/avatar.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SubmitButton(),
            ],
          ),
        );
      },
    );
  }
}
