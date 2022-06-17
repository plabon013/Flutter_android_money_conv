import 'package:bmi_calculator/pages/calculation_page.dart';
import 'package:bmi_calculator/pages/show_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CalculationPage.routeName,
      routes: {
        CalculationPage.routeName: (context) => CalculationPage(),
        ShowDetailsPage.routeName: (context) => ShowDetailsPage(),

      },
    );
  }
}
