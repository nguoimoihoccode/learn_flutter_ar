import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  IconData _getTimeIcon() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return Icons.wb_sunny;
    } else {
      return Icons.nightlight_round; 
    }
  }

  Color _getTimeIconColor() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 18) {
      return Colors.orangeAccent; // Màu cam cho icon mặt trời (ban ngày)
    } else {
      return Colors.blueAccent; // Màu xanh cho icon mặt trăng (ban đêm)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 120.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kOffWhite, kLightGray],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: kSecondary,
            // backgroundImage: NetworkImage("url"),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Deliver to",
                  style: appStyle(14, kSecondary, FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Số a Đường b, khối C, phường d,thành phố e , tỉnh f, g,akldjgfhnjkfothgidufhg",
                  overflow: TextOverflow.ellipsis,
                  style: appStyle(12, kDark, FontWeight.w400),
                ),
              ],
            ),
          ),
          Icon(
            _getTimeIcon(), 
            color: _getTimeIconColor(), 
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
