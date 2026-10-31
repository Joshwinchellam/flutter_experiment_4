import 'package:flutter/material.dart';

void main() {
  runApp(const CarMileageApp());
}

class CarMileageApp extends StatelessWidget {
  const CarMileageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Mileage Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CarMileagePage(),
    );
  }
}

class CarMileagePage extends StatefulWidget {
  const CarMileagePage({super.key});

  @override
  State<CarMileagePage> createState() => _CarMileagePageState();
}

class _CarMileagePageState extends State<CarMileagePage> {
  final _formKey = GlobalKey<FormState>();
  final _distanceController = TextEditingController();
  final _fuelController = TextEditingController();

  String _result = '';

  void _calculateMileage() {
    if (_formKey.currentState!.validate()) {
      final double distance = double.parse(_distanceController.text.trim());
      final double fuel = double.parse(_fuelController.text.trim());
      final double mileage = distance / fuel;

      String efficiency;
      if (mileage < 10) {
        efficiency = 'Poor Efficiency';
      } else if (mileage <= 15) {
        efficiency = 'Average Efficiency';
      } else {
        efficiency = 'Excellent Efficiency';
      }

      setState(() {
        _result =
            "Your car's mileage is ${mileage.toStringAsFixed(1)} km/l\n"
            "$efficiency";
      });
    } else {
      setState(() {
        _result = '';
      });
    }
  }

  @override
  void dispose() {
    _distanceController.dispose();
    _fuelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Mileage Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.directions_car,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Car Mileage Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _distanceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Distance Travelled',
                  hintText: 'Enter distance in kilometers',
                  prefixIcon: Icon(Icons.route),
                  suffixText: 'km',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the distance travelled';
                  }

                  final double? distance =
                      double.tryParse(value.trim());

                  if (distance == null || !distance.isFinite) {
                    return 'Enter a valid number';
                  }

                  if (distance <= 0) {
                    return 'Distance must be greater than 0';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _fuelController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Fuel Consumed',
                  hintText: 'Enter fuel consumed in liters',
                  prefixIcon: Icon(Icons.local_gas_station),
                  suffixText: 'L',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the fuel consumed';
                  }

                  final double? fuel = double.tryParse(value.trim());

                  if (fuel == null || !fuel.isFinite) {
                    return 'Enter a valid number';
                  }

                  if (fuel <= 0) {
                    return 'Fuel must be greater than 0';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculateMileage,
                  child: const Text(
                    'Calculate Mileage',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (_result.isNotEmpty)
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      _result,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
