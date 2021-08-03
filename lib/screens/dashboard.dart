import 'package:banking_app/components/action_button.dart';
import 'package:banking_app/components/credit_card.dart';
import 'package:banking_app/components/square_icon.dart';
import 'package:banking_app/styles/textstyles.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildAppBar(),
                _buildCards(),
                _buildActions(),
                _buildGoalsHeading(),
                _buildGoalsContent(),
                _buildTransactionsHeading(),
                _buildTransactionsContent()
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/placeholders/avatar.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back,',
                style: subtitle,
              ),
              Text(
                'Leonid',
                style: title,
              )
            ],
          ),
          Spacer(),
          IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: CreditCard(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
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
              height: 200,
              width: 50,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(
          action: 'Send',
          color: Colors.deepOrange[100],
          icon: Icons.arrow_forward,
        ),
        ActionButton(
          action: 'Receive',
          color: Colors.greenAccent[100],
          icon: Icons.arrow_downward,
        ),
        ActionButton(
          action: 'Exchange',
          color: Colors.yellowAccent[100],
          icon: Icons.swap_horiz,
        ),
        ActionButton(
          action: 'Other',
          color: Colors.grey[200],
          icon: Icons.scatter_plot,
        ),
      ],
    );
  }

  Widget _buildGoalsHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Goals',
            style: heading,
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

  Widget _buildGoalsContent() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SquareIcon(
                iconData: Icons.house_outlined, outline: Colors.greenAccent),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My own house',
                            style: title,
                          ),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: '\$54280 / ', style: subtitle),
                                TextSpan(text: '\$122000', style: title)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      child: LinearProgressIndicator(
                        value: 0.2,
                        color: Colors.grey,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions',
            style: heading,
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

  Widget _buildTransactionsContent() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SquareIcon(
                iconData: Icons.person_outline,
                outline: Colors.yellowAccent[100]),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Oleg D.',
                            style: title,
                          ),
                          Text(
                            '\$-150.00',
                            style: title,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sending Funds', style: subtitle),
                        Text('17:40', style: subtitle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
