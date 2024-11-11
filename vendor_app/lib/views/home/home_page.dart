import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app/common/custom_appbar.dart';
import 'package:vendor_app/common/custom_container.dart';
import 'package:vendor_app/constants/constants.dart';
import 'package:vendor_app/views/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h), 
        child: CustomAppbar()),
      body: SafeArea(
        child: CustomContainer(containerContent: Column(
          children: [
            CategoryList(),
          ],
        ),  
        ),
      ),
    );
  }
}