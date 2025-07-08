import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double _mobileBreakpoint = 600;
  static const double _tabletBreakpoint = 900;
  static const double _desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= _mobileBreakpoint &&
      MediaQuery.of(context).size.width < _tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _desktopBreakpoint;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= _tabletBreakpoint &&
      MediaQuery.of(context).size.width < _desktopBreakpoint;

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return 16.0;
    if (isTablet(context)) return 24.0;
    return 32.0;
  }

  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) return baseFontSize;
    if (isTablet(context)) return baseFontSize * 1.1;
    return baseFontSize * 1.2;
  }

  static int getCrossAxisCount(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    if (isLargeTablet(context)) return 3;
    return 4;
  }

  static EdgeInsets getResponsiveMargin(BuildContext context) {
    final padding = getResponsivePadding(context);
    return EdgeInsets.all(padding);
  }

  static double getMaxWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 800;
    return 1200;
  }
}
