import 'package:flutter/material.dart';

class TrapezoidPage extends StatefulWidget {
  const TrapezoidPage({Key? key}) : super(key: key);

  @override
  State<TrapezoidPage> createState() => _TrapezoidPageState();
}

class _TrapezoidPageState extends State<TrapezoidPage> {
  String area = '0';
  String circumference = '0';
  String error = '';

  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  TextEditingController _controllerD = TextEditingController();
  TextEditingController _controllerHeight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapezoid'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Trapezoid'),
              SizedBox(height: 10),
              Image.asset(
                'assets/images/trapesium.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerA,
                decoration: InputDecoration(
                  label: Text('A'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerB,
                decoration: InputDecoration(
                  label: Text('B'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerC,
                decoration: InputDecoration(
                  label: Text('C'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerD,
                decoration: InputDecoration(
                  label: Text('D'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerHeight,
                decoration: InputDecoration(
                  label: Text('Height'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 12)),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  if (_controllerA.text.isEmpty ||
                      _controllerB.text.isEmpty ||
                      _controllerC.text.isEmpty ||
                      _controllerD.text.isEmpty ||
                      _controllerHeight.text.isEmpty) {
                    setState(() {
                      error = 'Please fill all the fields';
                    });
                    return;
                  }

                  setState(() {
                    error = '';
                    double a = double.parse(_controllerA.text);
                    double b = double.parse(_controllerB.text);
                    double c = double.parse(_controllerC.text);
                    double d = double.parse(_controllerD.text);
                    double height = double.parse(_controllerHeight.text);

                    double area = ((a + b) * height) / 2;
                    double circumference = a + b + c + d;

                    this.area = area.toString();
                    this.circumference = circumference.toString();
                  });
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 10),
              Text('Area: $area'),
              SizedBox(height: 10),
              Text('Circumference: $circumference'),
            ],
          ),
        ),
      ),
    );
  }
}
