import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, web, ios, mac, windows, linux }

class BreakPoint {
  final bool isDefault;
  final Size? size;
  final String label;
  final DeviceType screenType;

  BreakPoint({
    this.isDefault = true,
    this.size,
    required this.screenType,
    required this.label,
  });
}

DeviceType deviceType(BuildContext context) {
  var deviceType = DeviceType.web;
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final orientation = MediaQuery.of(context).orientation;

  if (kIsWeb) {
    deviceType = DeviceType.web;
  } else if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    deviceType = DeviceType.mobile;
  } else if ((orientation == Orientation.portrait && screenWidth >= 600) ||
      (orientation == Orientation.landscape && screenHeight >= 600)) {
    deviceType = DeviceType.tablet;
  } else {
    switch (defaultTargetPlatform) {
      case TargetPlatform.linux:
        deviceType = DeviceType.linux;
        break;
      case TargetPlatform.macOS:
        deviceType = DeviceType.mac;
        break;
      case TargetPlatform.windows:
        deviceType = DeviceType.windows;
        break;
      default:
        deviceType = DeviceType.mobile;
        break;
    }
  }

  return deviceType;
}

class ResponsiveUiInit extends StatelessWidget {
  const ResponsiveUiInit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
