import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(this.name, this.iconPath, this.boxColor);

  static List<CategoryModel> getCategory() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        "Salad", "assets/icons/plate.svg", Color.fromARGB(255, 213, 240, 255)));

    categories.add(CategoryModel("Cake", "assets/icons/pancakes.svg",
        const Color.fromARGB(255, 249, 213, 255)));

    categories.add(CategoryModel(
        "Pie", "assets/icons/pie.svg", Color.fromARGB(255, 213, 240, 255)));

    categories.add(CategoryModel("Smoothies", "assets/icons/orange-snacks.svg",
        const Color.fromARGB(255, 249, 213, 255)));

    return categories;
  }
}
