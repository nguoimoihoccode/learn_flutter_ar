import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/back_ground_container.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/constants/constants.dart';
import 'package:vendor_app/constants/uidata.dart';
import 'package:vendor_app/views/categories/category_page.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "Categories", style: appStyle(24, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return CategoryTitle(category: category);
            }),
          ),
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  CategoryTitle({
    super.key,
    required this.category,
  });

  dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => CategoryPage(),
        transition: Transition.fadeIn,
        duration: Duration(microseconds: 600),
        );
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category["imageUrl"],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.fastfood, // Icon đồ ăn
              color: Colors.grey,
              size: 24.r,
            );
          },
        ),
      ),
      title: ReusableText(
        text: category['title'], 
        style: appStyle(12, kOffWhite, FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_forward_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}