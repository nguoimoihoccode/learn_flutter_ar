import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class MyModelViewer extends StatefulWidget {
  @override
  _MyModelViewerState createState() => _MyModelViewerState();
}

class _MyModelViewerState extends State<MyModelViewer> {
  Flutter3DController controller = Flutter3DController();
  String modelPath = 'assets/models/scene.gltf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Model Viewer'),
      ),
      body: Flutter3DViewer(
        src: modelPath,
        controller: controller,
        onLoad: (modelAddress) {
          print('Model loaded from: $modelAddress');
        },
        onError: (error) {
          print('Error loading model: $error');
        },
      ),
    );
  }
}
