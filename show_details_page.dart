import 'package:flutter/material.dart';

class ShowDetailsPage extends StatefulWidget {
  static String routeName = '/detailsPage';
  const ShowDetailsPage({Key? key}) : super(key: key);

  @override
  State<ShowDetailsPage> createState() => _ShowDetailsPageState();
}

class _ShowDetailsPageState extends State<ShowDetailsPage> {
  late double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details page')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Catagory', style: TextStyle(fontSize: 25),
                ),
                Text('BMI', style: TextStyle(fontSize: 25)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: bmi<16 ? Colors.green : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Underweight (Severe thinness)'),
                  Text('< 16.0'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: bmi>=16 && bmi<=16.9 ? Colors.yellow : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Underweight (Moderate thinness)'),
                  Text('16-16.9'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),Container(
              color: bmi>=17 && bmi<=18.4 ? Colors.yellow : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Underweight (Mild thinness)'),
                  Text('17-18.4'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),Container(
              color: bmi>=18.5 && bmi<=24.9 ? Colors.green : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Normal'),
                  Text('19-24.9'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: bmi>=25 && bmi<=29.9 ? Colors.orange : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Overweight (Pre-Obese)'),
                  Text('25-29.9'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: bmi>=30 && bmi<=34.9 ? Colors.red : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Obese(Class I)'),
                  Text('30-34.9'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),Container(
              color: bmi>=35 && bmi<=39.9 ? Colors.red : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Obese(Class II)'),
                  Text('35-39.9'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: bmi>40 ? Colors.red : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Obese(Class III)'),
                  Text('> 40'),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    bmi = ModalRoute.of(context)!.settings.arguments as double;
    super.didChangeDependencies();
  }
}
