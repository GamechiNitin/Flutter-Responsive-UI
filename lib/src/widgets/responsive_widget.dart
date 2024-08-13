import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/src/utils/responsive_device.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    this.smallMobile,
    this.smallDesktop,
    required this.largeDesktop,
    this.wideScreen,
  });
  final Widget? smallMobile;
  final Widget mobile;
  final Widget? tablet;
  final Widget? smallDesktop;
  final Widget? largeDesktop;
  final Widget? wideScreen;
  @override
  Widget build(BuildContext context) {
    if (tablet == null && smallDesktop == null && largeDesktop == null) {
      return mobile;
    } else {
      switch (DeviceInfo(context).deviceType) {
        case DeviceType.smallMobile:
          return smallMobile ?? mobile;
        case DeviceType.mobile:
          return mobile;
        case DeviceType.tablet:
          return tablet ?? largeDesktop ?? mobile;
        case DeviceType.smallDesktop:
          return smallDesktop ?? largeDesktop ?? mobile;
        case DeviceType.largeDesktop:
          return largeDesktop ?? mobile;
        case DeviceType.wideScreen:
          return wideScreen ?? largeDesktop ?? mobile;
        default:
          return mobile;
      }
    }
  }
}
