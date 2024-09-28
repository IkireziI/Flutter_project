import 'package:flutter/material.dart';

void main() => runApp(TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(title: Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Temperature input
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Conversion type selection
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: "CtoF",
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                Text("Celsius to Fahrenheit"),
                Radio(
                  value: "FtoC",
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value!;
                    });
                  },
                ),
                Text("Fahrenheit to Celsius"),
              ],
            ),

            SizedBox(height: 20),

            // Convert button
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),

            // Display converted value
            if (_convertedValue.isNotEmpty)
              Text(
                'Converted Value: $_convertedValue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            SizedBox(height: 20),

            // Display history
            Text('Conversion History:', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index]),
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
