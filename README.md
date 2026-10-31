# Flutter Exercise 4 – Car Mileage Calculator

## Aim
To design and implement a Car Mileage Calculator using Flutter Forms, TextFormField, input widgets, and Stateful Widgets, validate user inputs, and dynamically display the calculated mileage.

## Description
The application accepts the distance travelled in kilometers and fuel consumed in liters. It validates both inputs and calculates mileage by dividing distance by fuel consumed.

## Features
- Accepts distance travelled in kilometers.
- Accepts fuel consumed in liters.
- Validates empty fields.
- Validates positive numeric values.
- Calculates mileage in km/l.
- Displays Poor Efficiency, Average Efficiency, or Excellent Efficiency.

## Efficiency categories
- Below 10 km/l: Poor Efficiency
- 10 to 15 km/l: Average Efficiency
- Above 15 km/l: Excellent Efficiency

## Flutter concepts used
- `StatefulWidget` and `setState()` for dynamic UI updates.
- `Form` and `GlobalKey<FormState>` for form validation.
- `TextFormField` for user input and validation.
- `TextEditingController` for reading input values.
- `dispose()` for releasing controllers.
- `SingleChildScrollView`, `Column`, `Card`, and `ElevatedButton` for layout and interaction.

## Project structure
```text
flutter_ex4_car_mileage_calculator/
├── lib/
│   └── main.dart
├── pubspec.yaml
├── README.md
└── .gitignore
```

## Source status
This repository contains the Flutter source files and project configuration. The app has not been built or executed in this environment. A Flutter SDK is required to run or build it.

## Run locally (optional)
```bash
flutter pub get
flutter run
```
