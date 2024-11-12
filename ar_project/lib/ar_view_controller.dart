import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';

class ARViewController {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  ARViewController(this.arSessionManager, this.arObjectManager);

  // Khởi tạo phiên AR với các tùy chọn
  void onInitialize({
    bool showFeaturePoints = false,
    bool showPlanes = true,
    String? customPlaneTexturePath,
    bool showWorldOrigin = true,
  }) {
    arSessionManager.onInitialize(
      showFeaturePoints: showFeaturePoints,
      showPlanes: showPlanes,
      customPlaneTexturePath: customPlaneTexturePath,
      showWorldOrigin: showWorldOrigin,
    );
    arObjectManager.onInitialize();
  }

  // Hàm thêm một đối tượng 3D vào AR
  Future<bool?> addNode(ARNode node) async {
    return await arObjectManager.addNode(node);
  }

  // Giải phóng tài nguyên
  void dispose() {
    arSessionManager.dispose();
    // Không gọi dispose trên arObjectManager vì nó không có phương thức dispose
  }
}
