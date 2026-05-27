import 'package:sint/sint.dart';
import 'package:vrlizate/vrlizate.dart';

/// Registers VR engine services into Sint dependency injection.
///
/// ```dart
/// VRBindings.register();
/// final engine = Sint.find<VREngine>();
/// final raycaster = Sint.find<Raycaster>();
/// ```
class VRBindings {
  VRBindings._();

  /// Registers all VR services as lazy singletons.
  static void register({
    DeviceParams deviceParams = DeviceParams.cardboardV2,
  }) {
    // Engine
    Sint.lazyPut<VREngine>(() => VREngine());

    // Raycaster
    Sint.lazyPut<Raycaster>(() => Raycaster());

    // Device params
    Sint.lazyPut<DeviceParams>(() => deviceParams);

    // Distortion mesh (configured from device params)
    Sint.lazyPut<DistortionMesh>(() => DistortionMesh(
      coefficients: deviceParams.distortionCoefficients,
      screenToLensDistance: deviceParams.screenToLensDistance,
      interLensDistance: deviceParams.interLensDistance,
    ));
  }

  /// Unregisters all VR services.
  static void unregister() {
    if (Sint.isRegistered<VREngine>()) {
      Sint.find<VREngine>().dispose();
      Sint.delete<VREngine>();
    }
    Sint.delete<Raycaster>();
    Sint.delete<DeviceParams>();
    Sint.delete<DistortionMesh>();
  }
}
