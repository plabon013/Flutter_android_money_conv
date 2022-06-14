import 'package:flutter/material.dart';
import 'package:money_conversion/money_conv/setting.dart';


class HomePage extends StatefulWidget {
  //final String msg;

  //const HomePage({Key? key, required this.msg}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  double _result = 0.0;
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.msg),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Money Conversion',
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'BDT',
                ),
              ),
            ),
            Text('To'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    // final name = _nameController.text;
                    // final n = double.parse(name);
                    // double doller = n * 10;
                    // print(doller);
                    _calculate(ConvertionType.Dollar);
                  },
                  child: Text('Us dollar')),
              ElevatedButton(
                  onPressed: () {
                    _calculate(ConvertionType.GBP);
                  },
                  child: Text('GBP')),
              ElevatedButton(
                  onPressed: () {
                    _calculate(ConvertionType.EURO);
                  },
                  child: Text('EURO')),
              // Text(
              //   '$_nameController',
              //   style: Theme.of(context).textTheme.headline2,
              // ),
            ]),

            Text(
              _result.toStringAsFixed(2),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incriment,
        child: Icon(Icons.add),
      ),
    );
  }

  _calculate(ConvertionType Type) {
    final inputt = double.parse(_nameController.text);
    var rate = 0.0;
    switch (Type) {
      case ConvertionType.Dollar:
        rate = dollertobdt;
        break;

      case ConvertionType.GBP:
        rate = gbptobdt;
        break;

      case ConvertionType.EURO:
        rate = eurotobdt;
        break;
    }


    setState(() {
      _result=inputt/ rate;
    });


  }

  _incriment() {
    // _count++;
    // print(_count);
    setState(() {
      _count++;
      print(_count);
    });
  }
}
