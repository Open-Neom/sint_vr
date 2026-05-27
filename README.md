# SINT VR

A premium state management, dependency injection, and scene navigation extension of SINT specifically engineered for VR applications built with the **vrlizate** 3D engine.

## Features

- **VR Scene Bindings**: Seamless dependency injection lifecycle hooks designed for 3D/VR scene setup and tear-down.
- **VR Navigator**: Implements head-tracking gaze navigation and stereoscopic scene transitions.
- **VR Controller**: High-performance controller base classes tailored for real-time 3D object rendering, physics integration, and VR interaction cycles.
- **VR Translations**: Pre-configured dictionary-based real-time translation systems optimized for stereoscopic text layout containers.

## Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  sint_vr: ^0.2.0
```

## Usage

Extend your controllers from `VrController` to easily handle spatial updates and lifecycle callbacks:

```dart
import 'package:sint_vr/sint_vr.dart';

class MyVRSceneController extends VrController {
  @override
  void onInit() {
    super.onInit();
    // Initialize scene models and head tracking listeners
  }
}
```
