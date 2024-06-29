import 'package:comptetion/calorie_calc.dart';
import 'package:comptetion/imageslider.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BottomNavBar(),
//       routes: {
//         '/home': (context) => HomePage(),
//         '/daily_exercises': (context) => DailyExercisesPage(),
//         '/calorie_calculator': (context) => CalorieCalculatorPage(),
//       },
//     );
//   }
// }

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    DailyExercisesPage(),
    CalorieCalculatorPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Daily Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calorie Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlider();
  }
}

class DailyExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSlider();

  }
}

class CalorieCalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalorieCalculatorScreen();
  }
}
