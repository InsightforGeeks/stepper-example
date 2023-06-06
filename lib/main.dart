import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StepperScreen(),
    );
  }
}

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;
  List<Step> _steps = [
    const Step(
      title: Text('Step 1'),
      content: Text('This is the content for Step 1.'),
      isActive: true,
    ),
    const Step(
      title: Text('Step 2'),
      content: Text('This is the content for Step 2.'),
      isActive: false,
    ),
    const Step(
      title: Text('Step 3'),
      content: Text('This is the content for Step 3.'),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Widget Demo'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            _currentStep < _steps.length - 1 ? _currentStep++ : null;
          });
        },
        onStepCancel: () {
          setState(() {
            _currentStep > 0 ? _currentStep-- : null;
          });
        },
        steps: _steps,
      ),
      bottomNavigationBar: Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.all(16),
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'www.flutterforgeeks.com',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ))),
    );
  }
}
