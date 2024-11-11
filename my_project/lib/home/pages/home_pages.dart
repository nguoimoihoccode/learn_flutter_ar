import 'package:flutter/material.dart';
import 'package:my_project/home/pages/map_page.dart';
import 'package:my_project/home/widgets/locaitions_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: buildAppBar(context),
        body: const LocationsWidget(),
        bottomNavigationBar: buildBottomNavigation(),
      );

  PreferredSizeWidget buildAppBar(BuildContext context) => AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text('INTERESTS'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.location_pin),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationScreen(
                  latitude: 10.798200,
                  longitude: 106.668824,
                ),
              ),
            );
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.search_outlined),
        onPressed: () {},
      ),
    );


  Widget buildBottomNavigation() => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      );
}