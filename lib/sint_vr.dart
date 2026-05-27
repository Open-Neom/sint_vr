/// sint_vr — SINT extension for VR.
///
/// Adds VR-specific State management, Injection, Navigation, and Translations
/// on top of the SINT framework. Works with the vrlizate VR engine.
///
/// ```dart
/// import 'package:sint_vr/sint_vr.dart';
///
/// // Register VR services
/// VRBindings.register(deviceParams: DeviceParams.cardboardV2);
///
/// // Navigate to VR scene
/// VRNavigator.toVRScene('/vr/myScene');
///
/// // VR Controller with reactive state
/// class MyScene extends VRController {
///   @override
///   void onVRInit() {
///     engine.scene.add(LitMeshNode(geometry: CubeGeometry()));
///   }
/// }
/// ```
library;

// State — VR controllers and reactive scene state
export 'state/vr_controller.dart';
export 'state/vr_scene_state.dart';

// Injection — VR service registration
export 'injection/vr_bindings.dart';

// Navigation — VR scene routing and mode management
export 'navigation/vr_navigator.dart';
export 'navigation/vr_routes.dart';

// Translation — VR UI strings (EN + ES)
export 'translation/vr_translations.dart';
