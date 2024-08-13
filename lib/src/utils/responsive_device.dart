import 'package:flutter/material.dart';

/*
    Mobile Phones
    Small phones (portrait): 320px to 480px
    Large phones (portrait): 481px to 767px
    
    Tablets
    Portrait: 768px to 1024px
    Landscape: 1024px to 1280px
    
    Web/Desktop
    Small desktops: 1281px to 1440px
    Large desktops: 1441px and above
    TVs/Extra Large Screens

    Extra large screens: 1920px and above


 */
enum DeviceType {
  smallMobile,
  mobile,
  tablet,
  smallDesktop,
  largeDesktop,
  wideScreen,
}

const double smallMobileWidth = 480;
const double mobileWidth = 481;
const double tabletWidth = 600;
const double webWidth = 1280;

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

class DeviceInfo {
  final BuildContext context;
  DeviceInfo(this.context);

  // Method to determine the device type
  DeviceType get deviceType {
    final size = MediaQuery.of(context).size;
    // final aspectRatio = size.width / size.height;

    if (size.width < 480) {
      return DeviceType.smallMobile;
    } else if (size.width >= 480 && size.width < 600) {
      return DeviceType.mobile;
    } else if (size.width >= 600 && size.width < 1024) {
      return DeviceType.tablet;
    } else if (size.width >= 1224 && size.width < 1600) {
      return DeviceType.smallDesktop;
    } else if (size.width >= 1600 && size.width < 1920) {
      return DeviceType.largeDesktop;
    } else {
      return DeviceType.wideScreen;
    }
  }

  // Method to get a descriptive string of the device type
  String get deviceTypeDescription {
    switch (deviceType) {
      case DeviceType.smallMobile:
        return 'Small Mobile';
      case DeviceType.mobile:
        return 'Mobile';
      case DeviceType.tablet:
        return 'Tablet';
      case DeviceType.smallDesktop:
        return 'Small Desktop';
      case DeviceType.largeDesktop:
        return 'Large Desktop';
      case DeviceType.wideScreen:
        return 'Wide Screen';
      default:
        return 'Unknown';
    }
  }

  // Getter for mobile devices
  bool get isSmallMobile => deviceType == DeviceType.smallMobile;

  bool get isMobile => deviceType == DeviceType.mobile;

  // Getter for tablets
  bool get isTablet => deviceType == DeviceType.tablet;

  // Getter for small desktops
  bool get isSmallDesktop => deviceType == DeviceType.smallDesktop;

  // Getter for large desktops
  bool get isLargeDesktop => deviceType == DeviceType.largeDesktop;

  // Getter for wide screens
  bool get isWideScreen => deviceType == DeviceType.wideScreen;
}
