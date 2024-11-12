import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_project/ar_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ARViewScreen(),
    );
  }
}

class ARViewScreen extends StatefulWidget {
  @override
  _ARViewScreenState createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  late ARViewController arViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple AR Example'),
      ),
      body: ARView(
        onARViewCreated: _onARViewCreated,
      ),
    );
  }

  void _onARViewCreated(ARViewController controller) {
    arViewController = controller;

    // Khởi tạo phiên AR
    arViewController.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "images/triangle.png",
      showWorldOrigin: true,
    );

    // Thêm mô hình 3D
    _add3DModel();
  }

  void _add3DModel() async {
    var newNode = ARNode(
      type: NodeType.webGLB,
      uri: "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
      scale: vector.Vector3(0.2, 0.2, 0.2),
      position: vector.Vector3(0, 0, -1),
      rotation: vector.Vector4(1, 0, 0, 0),
    );

    bool? didAddNode = await arViewController.addNode(newNode);
    if (didAddNode == true) {
      print("3D model added successfully!");
    } else {
      print("Failed to add 3D model.");
    }
  }

  @override
  void dispose() {
    arViewController.dispose();
    super.dispose();
  }
}
