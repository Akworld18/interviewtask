import 'package:flutter/cupertino.dart';

class ProductDetailsModel{
  final IconData icon;
  final Color color;
  final String productName;
  final String productValue;
  final String productPercentage;
  final String productWeight;
  final String metalPrice;
  final String change;

  ProductDetailsModel({required this.color,
    required this.icon, required this.productName, required this.productValue, required this.productPercentage, required this.productWeight, required this.metalPrice, required this.change});
}