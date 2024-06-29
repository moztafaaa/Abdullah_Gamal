import 'package:flutter/material.dart';

class CalorieCalculatorScreen extends StatefulWidget {
  @override
  _CalorieCalculatorScreenState createState() =>
      _CalorieCalculatorScreenState();
}

class _CalorieCalculatorScreenState extends State<CalorieCalculatorScreen> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String selectedGender = 'Male';
  double caloriesNeeded = 0;

  void _calculateCalories() {
    final int? age = int.tryParse(ageController.text);
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);

    if (age == null || weight == null || height == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers')),
      );
      return;
    }

    final calculator = CalorieCalculator(
      age: age,
      sex: selectedGender,
      weigthKG: weight,
      height: height,
    );

    setState(() {
      caloriesNeeded = calculator.calculateBMR();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.black,
      ),
      body: 
   
         Container(
           color: Colors.black,
           child: SingleChildScrollView(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: height * 0.02),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: 'Weight in Kilograms',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: height * 0.02),
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(
                    labelText: 'Height in Cm',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text('Male'),
                      selected: selectedGender == 'Male',
                      onSelected: (bool selected) {
                        setState(() {
                          selectedGender = 'Male';
                        });
                      },
                      selectedColor: Colors.green,
                    ),
                    SizedBox(width: height * 0.02),
                    ChoiceChip(
                      label: Text('Female'),
                      selected: selectedGender == 'Female',
                      onSelected: (bool selected) {
                        setState(() {
                          selectedGender = 'Female';
                        });
                      },
                      selectedColor: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: ElevatedButton(
                    onPressed: _calculateCalories,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green;
                          }
                          return const Color.fromARGB(255, 255, 255, 255);
                        },
                      ),
                    ),
                    child: const Text('Calculate the calories you needed in a day',style: TextStyle(color: Colors.black),),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The Calories you needed is  ',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18.0),
                    ),
                    Text(
                      '$caloriesNeeded',
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                  ],
                ),
              ],
        ),
           ),
         ),
      );
  }
}

class CalorieCalculator {
  final int age;
  final String sex;
  final double weigthKG;
  final double height;

  CalorieCalculator({
    required this.age,
    required this.sex,
    required this.weigthKG,
    required this.height,
  });

  double calculateBMR() {
    if (sex == 'Male') {
      return 10 * weigthKG + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weigthKG + 6.25 * height - 5 * age - 161;
    }
  }
}