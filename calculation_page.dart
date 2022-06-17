import 'package:bmi_calculator/pages/show_details_page.dart';
import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  static String routeName = '/';
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {

  double weight = 50, height = 1.5;
  double bmi = 0;
  String status = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 50,),
            const Text('Weight', style: TextStyle(fontSize: 30),),
            Slider(
                min: 20,
                max: 120,
                divisions: 1000,
                label: weight.toStringAsFixed(1),
                value: weight, onChanged: (value){
              setState((){
                weight = value;
                calculateBmi();
              });
            }),
            Text('${weight.toStringAsFixed(1)} kg', style: TextStyle(fontSize: 30), ),
            SizedBox(height: 10,),
            const Text('Height', style: TextStyle(fontSize: 30),),
            Slider(
                min: 1.2,
                max: 2.2,
                divisions: 1000,
                label: height.toStringAsFixed(2),
                value: height, onChanged: (value){
              setState((){
                height = value;
                calculateBmi();
              });
            }),
            Text('${height.toStringAsFixed(1)} m', style: TextStyle(fontSize: 30), ),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle
              ),
              child: Center(child: Text('BMI\n${bmi.toStringAsFixed(1)}', style: TextStyle(fontSize: 40, color: Colors.white),)),
            ),
            Center(child: Text(status, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, ShowDetailsPage.routeName, arguments: bmi),
                 child: Text('View Details'))
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    bmi = weight/(height*height);
    if(bmi<16){
      status = 'Underweight (Severe thinness)';
    } else if(bmi>=16 && bmi <=16.9){
      status = 'Underweight (Moderate thinness)';
    }else if(bmi>=17 && bmi <=18.4){
      status = 'Underweight (Mild thinness)';
    }else if(bmi>=18.5 && bmi <=24.9){
      status = 'Normal';
    }else if(bmi>=25 && bmi <=29.9){
      status = 'Overweight (Pre-obese)';
    }else if(bmi>=30 && bmi <=34.9){
      status = 'Obese (Class I)';
    }else if(bmi>=35 && bmi <=39.9){
      status = 'Obese (Class II)';
    } else {
      status = 'Obese (Class III)';
    }
  }
}
