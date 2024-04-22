import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  /// hero figma properties
  /// fontFamily: DM Sans
  /// fontSize: 96px
  /// height: 96px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle hero = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 96,
    height: 1,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.92,
  );

  /// headline1 figma properties
  /// fontFamily: DM Sans
  /// fontSize: 64px
  /// height: 64px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headline1 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 64,
    height: 1,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.28,
  );

  /// headline2 figma properties
  /// fontFamily: DM Sans
  /// fontSize: 48px
  /// height: 56px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headline2 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 48,
    height: 1.17,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.96,
  );

  /// headline3 figma properties
  /// fontFamily: DMSans
  /// fontSize: 40px
  /// height: 48px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headline3 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 40,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
  );

  /// headline4 figma properties
  /// fontFamily: DMSans
  /// fontSize: 32px
  /// height: 40px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headline4 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.64,
  );

  /// body1 figma properties
  /// fontFamily: DMSans
  /// fontSize: 24px
  /// height: 32px
  /// fontWeight: 400
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle body1 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.48,
  );

  /// body1Bold figma properties
  /// fontFamily: DMSans
  /// fontSize: 24px
  /// height: 32px
  /// fontWeight: 700
  /// letterSpacing: -2%
  /// fontStyle: none
  /// decoration: none
  static const TextStyle body1Bold = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );

  /// body2 figma properties
  /// fontFamily: Poppins
  /// fontSize: 16px
  /// height: 24px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle body2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// body2Medium figma properties
  /// fontFamily: Poppins
  /// fontSize: 16px
  /// height: 24px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle body2Medium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// caption figma properties
  /// fontFamily: Poppins
  /// fontSize: 14px
  /// height: 24px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    height: 1.71,
    fontWeight: FontWeight.w400,
  );

  /// captionMedium figma properties
  /// fontFamily: Poppins
  /// fontSize: 14px
  /// height: 24px
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle captionMedium = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    height: 1.51,
    fontWeight: FontWeight.w500,
  );

  /// caption2 figma properties
  /// fontFamily: Poppins
  /// fontSize: 12px
  /// height: 20px
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle caption2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 1.67,
    fontWeight: FontWeight.w400,
  );

  /// caption2Semibold figma properties
  /// fontFamily: Poppins
  /// fontSize: 12px
  /// height: 20px
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle caption2Semibold = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 1.67,
    fontWeight: FontWeight.w600,
  );

  /// hairline1 figma properties
  /// fontFamily: Poppins
  /// fontSize: 12px
  /// height: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle hairline1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 1.67,
    fontWeight: FontWeight.w700,
  );

  /// hairline2 figma properties
  /// fontFamily: Poppins
  /// fontSize: 12px
  /// height: 12px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle hairline2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    height: 1,
    fontWeight: FontWeight.w700,
  );

  /// button1 figma properties
  /// fontFamily: DMSans
  /// fontSize: 16px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle button1 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 16,
    height: 1,
    fontWeight: FontWeight.w700,
  );

  /// button2 figma properties
  /// fontFamily: DMSans
  /// fontSize: 14px
  /// height: 16px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle button2 = TextStyle(
    fontFamily: 'DMSans',
    fontSize: 14,
    height: 1.14,
    fontWeight: FontWeight.w700,
  );

}
