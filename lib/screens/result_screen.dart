import 'package:flutter/material.dart';
import '../constraints.dart';
import '../base_card.dart';

class ResultScreen extends StatelessWidget {
  final String currency1;
  final String currency2;
  final double ratio;

  const ResultScreen({super.key, required this.currency1, required this.currency2, required this.ratio});

  @override
  Widget build(BuildContext context) {
    final String ratioStr = ratio.toStringAsFixed(3);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Currency Convertor Result',
          style: TextStyle(
            color: kDarkTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // currency showing
            BaseCard(
              theColor: kBlueCardColor,
              theWidth: double.infinity,
              theHeight: 80,
              hasBorder: false,
              theChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currency1,
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Text(
                    ':',
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Text(
                    currency2,
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),

            // ratio showing
            FractionallySizedBox(
              widthFactor: 0.6,
              child: BaseCard(
                theColor: kBlueCardColor,
                theWidth: double.infinity,
                theHeight: 80,
                hasBorder: false,
                theChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      ':',
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width:16),
                    Text(
                      ratioStr,
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
