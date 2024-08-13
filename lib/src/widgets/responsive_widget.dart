import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/src/utils/responsive_device.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.web,
  });
  final Widget mobile;
  final Widget tablet;
  final Widget web;
  @override
  Widget build(BuildContext context) {
    switch (deviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.web:
        return web;
      case DeviceType.tablet:
        return tablet;
      default:
        return mobile;
    }
  }
}
