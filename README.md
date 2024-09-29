# temperature_converter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

🌡️ Temperature Converter App
A simple Flutter app that converts temperatures between Celsius and Fahrenheit with a user-friendly interface. The app displays real-time conversions and maintains a history of past conversions.

📱 Features
Convert Celsius to Fahrenheit and Fahrenheit to Celsius.
Conversion history that tracks each calculation.
Responsive design for both portrait and landscape orientations.
Input validation to handle incorrect entries.
🛠️ How It Works
Enter Temperature: Input a value in the text field.
Select Conversion: Choose either Celsius to Fahrenheit or Fahrenheit to Celsius using the radio buttons.
Convert: Press the 'Convert' button to display the converted result.
View History: Scroll through the history of conversions.
Example:
25 °C ➡️ 77.00 °F
100 °F ➡️ 37.78 °C


mathematica

C to F: 25.0 => 77.0
F to C: 100.0 => 37.8
🚀 Getting Started
Prerequisites
Flutter SDK Install Flutter
Installation
Clone the repo:


git clone https://https://github.com/IkireziI/flutter_project.git
Install dependencies:


flutter pub get


flutter run
🛠️ Code Overview
TextField: For user input.
Radio Buttons: Select conversion type.
ElevatedButton: Triggers conversion.
ListView: Displays the conversion history.
Conversion Formulas:
C to F: °F = °C * 9/5 + 32
F to C: °C = (°F - 32) * 5/9
