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
enum DeviceType { smallMobile, mobile, tablet, web, ios, mac, windows, linux }

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

DeviceType deviceType(BuildContext context) {
  var deviceType = DeviceType.web;
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  final orientation = MediaQuery.of(context).orientation;

  if ((orientation == Orientation.portrait && screenWidth >= webWidth) ||
      (orientation == Orientation.landscape && screenHeight >= webWidth)) {
    deviceType = DeviceType.web;
  } else if ((orientation == Orientation.portrait &&
          screenWidth <= smallMobileWidth) ||
      (orientation == Orientation.landscape && screenHeight <= tabletWidth)) {
    deviceType = DeviceType.smallMobile;
  } else if ((orientation == Orientation.portrait &&
          screenWidth <= tabletWidth) ||
      (orientation == Orientation.landscape && screenHeight <= tabletWidth)) {
    deviceType = DeviceType.mobile;
  } else if ((orientation == Orientation.portrait &&
          screenWidth >= tabletWidth) ||
      (orientation == Orientation.landscape && screenHeight >= tabletWidth)) {
    deviceType = DeviceType.tablet;
  } else {
    deviceType = DeviceType.mobile;
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
