import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel(this.name, this.iconPath, this.level, this.duration, this.calorie,
      this.boxColor, this.viewIsSelected);

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        "Honey Pancake",
        "assets/icons/honey-pancakes.svg",
        "Easy",
        "30mins",
        "180kCal",
        const Color.fromARGB(255, 213, 240, 255),
        true));

    diets.add(DietModel(
      'Canai Bread',
      'assets/icons/canai-bread.svg',
      'Easy',
      '20mins',
      '230kCal',
      const Color.fromARGB(255, 249, 213, 255),
      false,
    ));

    return diets;
  }
}
