import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen()));

            Get.to(CalculatorScreen());

          },
          label: const Text("Calculator"),
          icon: const Icon(Icons.calculate_outlined),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
