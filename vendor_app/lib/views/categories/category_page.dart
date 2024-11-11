import 'package:flutter/material.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ReusableText(text: "text", style: appStyle(24, kGray, FontWeight.w600)),
        backgroundColor: kOffWhite,
      ),
      body: Center(
        child: Text("Category"),
      ),
    );
  }
}