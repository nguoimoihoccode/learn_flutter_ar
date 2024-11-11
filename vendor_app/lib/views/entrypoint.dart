import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vendor_app/constants/constants.dart';
import 'package:vendor_app/controllers/tab_index_controller.dart';
import 'package:vendor_app/views/cart/cart_page.dart';
import 'package:vendor_app/views/home/home_page.dart';
import 'package:vendor_app/views/profile/profile_page.dart';
import 'package:vendor_app/views/search/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.put(TabIndexController());
  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          pageList[controller.tabIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(data: Theme.of(context).copyWith(canvasColor: kPrimary),
             child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme: const IconThemeData(color: Colors.black38),
              selectedIconTheme: IconThemeData(color: kSecondary),
              onTap: (value) {
                controller.setTabIndex = value;
              },
              currentIndex: controller.tabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: controller.tabIndex == 0 
                  ? Icon(AntDesign.appstore1) 
                  : Icon(AntDesign.appstore_o),
                   label: "Home"),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
                const BottomNavigationBarItem(
                  icon: Badge(
                    textColor: kBackground,
                    label: Text("1"),
                    child: Icon(FontAwesome.opencart)), label: "Card"),
                BottomNavigationBarItem(
                  icon: controller.tabIndex == 3 
                  ? Icon(FontAwesome.user_circle)
                  : Icon(FontAwesome.user_circle_o), label: "Profile"),
              ])),
          ),
        ],
      ),
    )
  ); 
  }
}