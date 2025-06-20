import 'package:flutter/material.dart';
import '../constraints.dart';
import '../base_card.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DataEntryScreenState();
  }
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Currency Convertor',
          style: TextStyle(
            color: kDarkTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Currency 1 Base Card
            BaseCard(
                theColor: kPinkCardColor,
                theWidth: double.infinity,
                theHeight: 80,
                theOnTapFunc: () {},
                theChild: Row(
                  children: [
                    Icon(Icons.circle_outlined),
                    SizedBox(width: 12,),
                    Text(
                      'Currency 1',
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Amount',
                      style: TextStyle(
                        color: kGreyTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ),

            SizedBox(height: 45,),

            // Currency 2 Base Card
            BaseCard( //duplicate the card
              theColor: kPinkCardColor,
              theWidth: double.infinity,
              theHeight: 80,
              theOnTapFunc: () {},
              theChild: Row(
                children: [
                  Icon(Icons.circle_outlined),
                  SizedBox(width: 12,),
                  Text(
                    'Currency 2',
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Amount',
                    style: TextStyle(
                      color: kGreyTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 400,),

            // Show Rate Button Base Card
            FractionallySizedBox(
              widthFactor: 0.5,
              child: BaseCard(
                theColor: kButtonColor,
                theWidth: double.infinity, // still infinity but use fractionally 0.5, so half
                theHeight: 80,
                theOnTapFunc: () {
                  //TODO: navigate to next screen
                },
                theChild: const Center(
                  child: Text(
                    'Show Rate',
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}