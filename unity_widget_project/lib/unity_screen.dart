import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unity in Flutter')),
      body: UnityWidget(
        onUnityCreated: (controller) {
          print('Unity created!');
        },
      ),
    );
  }
}
