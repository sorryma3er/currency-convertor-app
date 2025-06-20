import 'package:flutter/material.dart';
import '../constraints.dart';
import '../base_card.dart';
import 'result_screen.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DataEntryScreenState();
  }
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final List<String> _currencies = ['USD', 'THB', 'CNY', 'JPY', 'TWD', 'HKD', 'EUR', 'CAD', 'MYR', 'GBP', 'SGD', 'AUD'];
  final Map<String, double> _rateToCNY = {
    'CNY': 1.0,
    'USD': 7.2,
    'THB': 0.22,
    'JPY': 0.05,
    'TWD': 0.25,
    'HKD': 0.92,
    'EUR': 8.31,
    'CAD': 5.27,
    'MYR': 1.7,
    'GBP': 9.72,
    'SGD': 5.61,
    'AUD': 4.68
  };

  String _currency1 = 'CNY';
  String _currency2 = 'THB';
  String _amount1 = '';
  double _amount2 = 0.0; // computed val

  void _recalculateAmount2() {
    final input = double.tryParse(_amount1) ?? 0.0; // default to 0.0 if null
    final double rate1 = _rateToCNY[_currency1]!;
    final double rate2 = _rateToCNY[_currency2]!;
    setState(() {
      _amount2 = input * rate1 / rate2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Currency Converter',
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

            // Currency 1 + Amount 1 Base Card
            BaseCard(
                theColor: kPinkCardColor,
                theWidth: double.infinity,
                theHeight: 80,
                hasBorder: true,
                theChild: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle_outlined),
                    // currency 1 drop down list
                    Expanded(
                      flex: 2, // get 2/5 of this row width
                      child: DropdownButtonFormField<String>(
                          value: _currency1, // default value
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                          ),
                          items: _currencies.map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(
                                currency,
                                style: const TextStyle(
                                    color: kDarkTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                          )).toList(),
                          onChanged: (value) {
                            if (value == null) return;
                            _currency1 = value;
                            _recalculateAmount2();
                          },
                      ),
                    ),

                    const Spacer(flex: 1), // get 1/5

                    // Amount field
                    Expanded(
                      flex: 2, // get 2/5
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(decimal:true),
                        decoration: const InputDecoration(
                          hintText: 'Amount',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal:12, vertical: 0),
                        ),
                        style: TextStyle(
                          color: kDarkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          _amount1 = value;
                          _recalculateAmount2();
                        },
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
              hasBorder: true,
              theChild: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.circle_outlined),
                  // Currency 2 drop down list
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _currency2, // default val
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal:12),
                      ),
                      items: _currencies.map((currency) => DropdownMenuItem(
                        value: currency,
                        child: Text(
                          currency,
                          style: TextStyle(
                            color: kDarkTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )).toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        _currency2 = value;
                        _recalculateAmount2();
                      },
                    ),
                  ),

                  const Spacer(flex: 1),

                  // Amount field of currency 2, read only computed field
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        _amount2.toStringAsFixed(3),
                        style: TextStyle(
                          color: kDarkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex:2),

            // Show Rate Button Base Card
            FractionallySizedBox(
              widthFactor: 0.5,
              child: BaseCard(
                theColor: kButtonColor,
                theWidth: double.infinity, // still infinity but use fractionally 0.5, so half
                theHeight: 80,
                hasBorder: false,
                theOnTapFunc: () {
                  final double rate1 = _rateToCNY[_currency1]!;
                  final double rate2 = _rateToCNY[_currency2]!; // use ! to make double? into double
                  final double ratio = rate1 / rate2;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        currency1: _currency1,
                        currency2: _currency2,
                        ratio: ratio,
                      ),
                    ),
                  );
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

            const Spacer(flex:1),
          ],
        ),

      ),
    );
  }
}