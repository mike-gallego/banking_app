import 'package:banking_app/components/credit_card.dart';
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
              children: [_buildAppBar(), _buildCards()],
            ),
          ),
        ),
      ),
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
}
