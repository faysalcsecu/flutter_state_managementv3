import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Declare Controller
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  // text for result
  // String result = "0";

  var result = "0".obs;

  sum(String firstnumber, String secondnumber) {
    int f = int.parse(firstnumber);
    int s = int.parse(secondnumber);
    int sum = f + s;
    // result = sum.toString();

    // setState(() {
    //   // result = sum.toString();
    // });

    //getx
    result.value = sum.toString();
  }

  // getx

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Added padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center widgets
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter First Number",
                  hintText: "0",
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Second Number",
                  hintText: "0",
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                String firstNumber = firstController.text;
                String secondNumber = secondController.text;

                if (firstNumber.isNotEmpty && secondNumber.isNotEmpty) {
                  sum(firstNumber, secondNumber);
                } else {
                  Get.snackbar(
                    "Error",
                    "Invalid input. Please enter valid numbers.",
                  );
                }
              },
              label: const Text("Calculate"), // Fixed missing label
              icon: const Icon(Icons.calculate_outlined),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            const SizedBox(height: 20),
            //  Text(result, style: TextStyle(
            //   fontSize: 50,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.blue,
            // ),),
            Obx(
                  () => Text(
                result.value,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
