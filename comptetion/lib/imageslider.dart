import 'dart:async';
import 'package:comptetion/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _images = [
    'assets/Motivate1.jpg',
    'assets/Motivate2.jpg',
    'assets/Motivate3.jpg',
    'assets/Motivate4.jpg',
    'assets/Motivate5.jpg',
    'assets/Motivate6.jpg',
    'assets/Motivate7.jpg',
    'assets/Motivate8.jpg',
    'assets/Motivate9.jpg',
    'assets/Motivate10.jpg',
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startSlider();
  }

  void _startSlider() {
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.4;
    double containerWidth = MediaQuery.of(context).size.width * 1;

    return Column(children: [
      SingleChildScrollView(
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.asset(_images[index], fit: BoxFit.fill);
              },
            ),
          ),
        ),
      ),
      SizedBox(
        height: 35,
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: containerWidth,

        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2),
        ),
      ),

    ]);
  }
}
