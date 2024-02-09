import 'package:flutter/material.dart';
import 'package:vgts_design_task/app/features/dashboard/model/z_dashboard_model_export.dart';




List<BottomButtonModel>bottomButtons=[
  BottomButtonModel(key: "HOME", name: "Home", iconData: Icons.home),
  BottomButtonModel(key: "PORTFOLIO", name: "Portfolio", iconData: Icons.account_box_outlined),
  BottomButtonModel(key: "CENTER", name: "Center", iconData: Icons.ac_unit),
  BottomButtonModel(key: "PRICE", name: "Prices", iconData: Icons.price_check_outlined),
  BottomButtonModel(key: "SETTING", name: "Settings", iconData: Icons.settings),
];

List <ProductDetailsModel>productDetails = [
  ProductDetailsModel(
      color: Colors.yellow,
      icon: Icons.rectangle,
      productName: "Gold",
      productValue: "\$22,265.64",
      productPercentage: "0.97%",
      productWeight: "11.050oz",
      metalPrice: "\$1,999.00",
      change: "-0.4%"),
  ProductDetailsModel(
      color: Colors.grey,
      icon: Icons.rectangle,
      productName: "Silver",
      productValue: "\$0.00",
      productPercentage: "0.0%",
      productWeight: "0.000oz",
      metalPrice: "\$26.20",
      change: "-0.15%"),
  ProductDetailsModel(
      color: Colors.pink,
      icon: Icons.rectangle,
      productName: "Platinum",
      productValue: "\$0.00",
      productPercentage: "0.0%",
      productWeight: "0.000oz",
      metalPrice: "\$1,202.30",
      change: "-0.08%")
];

