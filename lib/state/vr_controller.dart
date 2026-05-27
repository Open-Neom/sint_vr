import 'package:sint/sint.dart';
import 'package:vrlizate/vrlizate.dart';

/// Base controller for VR scenes. Extends SintController with
/// VR engine lifecycle management and reactive state.
///
/// ```dart
/// class MyVRScene extends VRController {
///   @override
///   void onVRInit() {
///     engine.scene.add(LitMeshNode(geometry: CubeGeometry()));
///     engine.scene.add(Light.directional());
///   }
///
///   @override
///   void onVRUpdate(double dt) {
///     // Per-frame logic
///   }
/// }
/// ```
abstract class VRController extends SintController {
  late final VREngine engine;

  // Reactive VR state
  final isVRRunning = true.obs;
  final isStereoMode = true.obs;
  final showDebugOverlay = false.obs;
  final currentFps = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    engine = VREngine();
    engine.onUpdate = (dt) {
      currentFps.value = engine.fps;
      onVRUpdate(dt);
    };
    onVRInit();
    engine.start();
  }

  /// Override to set up the VR scene (add meshes, lights, etc.)
  void onVRInit();

  /// Override for per-frame logic.
  void onVRUpdate(double dt) {}

  void toggleStereo() => isStereoMode.toggle();

  void toggleDebug() => showDebugOverlay.toggle();

  void toggleRunning() {
    isVRRunning.toggle();
    if (isVRRunning.value) {
      engine.start();
    } else {
      engine.stop();
    }
  }

  @override
  void onClose() {
    engine.dispose();
    super.onClose();
  }
}
