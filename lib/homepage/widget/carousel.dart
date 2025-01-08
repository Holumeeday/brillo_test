import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> images = [
    'assets/image1.jpeg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: CarouselSlider(
        items: images.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                imageUrl,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}
