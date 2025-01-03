import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/constants/constants.dart';
import 'package:vendor_app/controllers/category_controller.dart';
import 'package:vendor_app/views/categories/all_categories.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if(controller.categoryValue == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(() => AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
        }
        else {
        controller.updateCategory = category['_id'];
        controller.updateTitle = category['title'];
        }
      },
      child: Obx(() => Container(
        margin: EdgeInsets.only(right: 5.w),
        padding: EdgeInsets.only(top: 4.h),
        width: width*0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: controller.categoryValue == category['_id'] ? kPink : kOffWhite , width: .5.w),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
              child: Image.network(
                category['imageUrl'] ?? '', 
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.fastfood, 
                    size: 35.h,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            ReusableText(
              text: category['title'],
              style: appStyle(12, kDark, FontWeight.normal),
            ),
          ],
      
        ),
      ),
    ));
  }
}