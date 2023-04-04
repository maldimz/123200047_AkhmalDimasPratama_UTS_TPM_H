import 'package:flutter/material.dart';

class CylinderPage extends StatefulWidget {
  const CylinderPage({Key? key}) : super(key: key);

  @override
  State<CylinderPage> createState() => _CylinderPageState();
}

class _CylinderPageState extends State<CylinderPage> {
  String volume = '0';
  String circumference = '0';
  String error = '';

  TextEditingController _controllerRadius = TextEditingController();
  TextEditingController _controllerHeight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cylinder'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Cylinder'),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/cylinder.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _controllerRadius,
                  decoration: InputDecoration(
                    label: Text('Radius'),
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
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controllerHeight.text.isEmpty ||
                        _controllerRadius.text.isEmpty) {
                      setState(() {
                        error = 'Please fill all the fields';
                      });
                      return;
                    }

                    setState(() {
                      error = '';
                      double radius =
                          double.tryParse(_controllerRadius.text) ?? 0;
                      double height =
                          double.tryParse(_controllerHeight.text) ?? 0;
                      double volume = 3.14 * radius * radius * height;
                      double circumference =
                          2 * 3.14 * radius * (radius + height);
                      this.volume = volume.toString();
                      this.circumference = circumference.toString();
                    });
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 10),
                Text('Volume: $volume'),
                SizedBox(height: 10),
                Text('Circumference: $circumference'),
              ],
            )),
      ),
    );
  }
}
