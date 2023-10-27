import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String id;
  String image;
  Color color;

  CategoryModel(this.name, this.id, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel("Sports", "sports",
          "assets/images/sports.png", Colors.red),
      CategoryModel(
          "Business", "business",
          "assets/images/bussines.png", Color(0xffCF7E48)),
      CategoryModel("Entertainment", "entertainment",
          "assets/images/environment.png", Color(0xff4882CF)),
      CategoryModel(
          "General",
          "general",
          "assets/images/politics.png", Color(0xFF003E90)),
      CategoryModel("Health", "health",
          "assets/images/health.png", Colors.pink),
      CategoryModel(
          "Science", "science",
          "assets/images/science.png", Colors.yellow),
      CategoryModel("Technology",
          "technology", "assets/images/environment.png",
          Colors.lightGreen),
    ];
  }
}
