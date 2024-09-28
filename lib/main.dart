import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary theme color
        brightness: Brightness.light, // Light mode theme
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  String _conversionType = "CtoF"; // Default conversion type
  TextEditingController _tempController = TextEditingController();
  String _convertedValue = "";
  List<String> _history = [];

  // Conversion formulas
  double _convertToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  double _convertToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  void _convertTemperature() {
    double inputTemp = double.tryParse(_tempController.text) ?? 0.0;
    double result;

    if (_conversionType == "CtoF") {
      result = _convertToFahrenheit(inputTemp);
      _history.add("C to F: ${inputTemp.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}");
    } else {
      result = _convertToCelsius(inputTemp);
      _history.add("F to C: ${inputTemp.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}");
    }

    setState(() {
      _convertedValue = result.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade50, Colors.lightBlue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Temperature input
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature',
                labelStyle: TextStyle(color: Colors.blue.shade700), // Label text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Conversion type selection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  activeColor: Colors.blueAccent,
                  value: "CtoF",
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                Text("Celsius to Fahrenheit", style: TextStyle(color: Colors.blue.shade700)),
                Radio(
                  activeColor: Colors.orangeAccent,
                  value: "FtoC",
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                Text("Fahrenheit to Celsius", style: TextStyle(color: Colors.orange.shade700)),
              ],
            ),

            SizedBox(height: 20),

            // Convert button
            ElevatedButton(
              onPressed: _convertTemperature,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Text color on button
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              ),
              child: Text(
                'Convert',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Display converted value
            if (_convertedValue.isNotEmpty)
              Text(
                'Converted Value: $_convertedValue',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700, // Result text color
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: 20),

            // Display history
            Text(
              'Conversion History:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800, // History label color
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: index % 2 == 0 ? Colors.lightBlue.shade50 : Colors.lightBlue.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _history[index],
                        style: TextStyle(fontSize: 16, color: Colors.blue.shade700),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

