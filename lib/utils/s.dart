import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpmbs/utils/dimensions.dart';

class S{
  static final colors=_Colors();
  static final textStyles=_TextStyle();
  static final shadow=_Shadow();
  static final font=_Font();
}

class _Font{
  static const path='assets/fonts';
  String oxygen='$path/Oxygen-Regular.ttf';
}

class _Colors {
  Color colorPrimary = const Color(0xFF2F80ED);
  Color appbarBGColor = const Color(0xFF2D9CDB);
  Color colorAppBar = const Color(0xFF6585DB);
  Color colorPrimaryOpacity = const Color(0xFF6585DB).withOpacity(0.4);
  Color colorGrey = const Color(0xffE5E5E5);
  Color colorPageBG = const Color(0xe5e5e5ff);
  Color colorButtonTextColor = const Color(0xe0ffffff);
  Color colorHeadlineColor = const Color(0xe0000000);
  Color black = const Color(0xe0000000);
  Color white = const Color(0xeFFFFFFF);
  Color colorBodyText = const Color(0xe0000000);
  Color colorBGWhite = const Color(0xe0ffffff);
  Color colorQuestionText = const Color(0xe0000000);
  Color colorRed = const Color(0xe0FF0101);
  Color colorSignBG = const Color(0xe0c4c4c4);
  Color colorChipBG = const Color(0xe0c4c4c4);
  Color drawerMenuItem = const Color(0xe0354052);
  Color drawerAdd = const Color(0x0e042253);
  Color colorChipText = const Color(0xe0000000);
  Color colorSign = const Color(0xe01C1C1C);
  Color darkBlue = const Color(0xe0042253);
  Color darkBlue2 = const Color(0xe0123F88);
  Color blue = const Color(0xe06585DB);
  Color whiteShade = const Color(0xe0F7F8FA);
  Color blueShade = const Color(0xe06585DB);
  Color outerDropShadow = const Color(0xe06585DB);
  Color circleAvatarColor = const Color(0xe0828282);
  Color greyShade = const Color(0XFFB9BBB6);
  Color donateNowButton = const Color(0XFF2AE80B);

  Color boxGradient1 = const Color(0xe067EBDA);
  Color boxGradient2 = const Color(0xe0F87270);
  Color boxGradient3 = const Color(0xe0F87270);
  Color boxGradient4 = const Color(0xe06161EA);

  Color colorTransparent = const Color(0x00000000);
  Color hint = Colors.grey;
  Color fbColor = const Color(0xFF3D639D);
  Color buttonColor = const Color(0xFF6585DB);
  Color drawerBG = const Color(0xFFE5E5E5);

  Color grey = const Color(0xe0354052);
  Color lightGrey = const Color(0xFFD9D9D9);
  Color lightYellow = const Color(0x4DFFBF00);
  Color lightRed = const Color(0x33F87270);
  Color lightGreen = const Color(0x3334A853);
  Color lightTeal = const Color(0x3367EBDA);
  Color lightPurple = const Color(0x336585DB);

  //Rainbow colors
  Color colorRainbow1 = const Color(0xFFBB1E21);
  Color colorRainbow2 = const Color(0xFFC3681D);
  Color colorRainbow3 = const Color(0xFFCCBE14);
  Color colorRainbow4 = const Color(0xFF369846);
  Color colorRainbow5 = const Color(0xFF2788b8);
  Color colorRainbow6 = const Color(0xFF283072);
  Color colorRainbow7 = const Color(0xFF542B71);



  MaterialColor primaryMaterialColor = const MaterialColor(
    0xFF6585DB,
    <int, Color>{
      50: Color(0xFF6585DB),
      100: Color(0xFF6585DB),
      200: Color(0xFF6585DB),
      300: Color(0xFF6585DB),
      400: Color(0xFF6585DB),
      500: Color(0xFF6585DB),
      600: Color(0xFF6585DB),
      700: Color(0xFF6585DB),
      800: Color(0xFF6585DB),
      900: Color(0xFF6585DB),
    },
  );
}

class _TextStyle{
  TextStyle appTextStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontFamily: 'Oxygen',
      fontSize: fontSize ?? Dimensions.FONT_SIZE_SMALL,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? S.colors.white,
      //overflow: overflow ?? TextOverflow.ellipsis
    );
  }

  TextStyle titleTextStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color,TextDecoration? textDecoration,}) {
    return TextStyle(
        fontFamily: 'Oxygen',
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: fontSize ?? Dimensions.FONT_SIZE_EXTRA_LARGE,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? S.colors.black);
  }

  TextStyle hintStyle = TextStyle(
    fontSize: 14,
    color: S.colors.hint,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Oxygen',
  );

  TextStyle normalTextStyle(
      {double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextDecoration? textDecoration,
        FontStyle? fontStyle}) {
    return TextStyle(
      fontFamily: 'Oxygen',
      decoration: textDecoration ?? TextDecoration.none,
      fontSize: fontSize ?? Dimensions.FONT_SIZE_DEFAULT,
      color: color ?? S.colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle ?? FontStyle.normal,
    );
  }

  TextStyle robotoNormalTextStyle(
      {double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextDecoration? textDecoration,
        FontStyle? fontStyle}) {
    return GoogleFonts.roboto(
      decoration: textDecoration ?? TextDecoration.none,
      fontSize: fontSize ?? Dimensions.FONT_SIZE_DEFAULT,
      color: color ?? S.colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle ?? FontStyle.normal,
    );
  }


  /// button weight: bold, font size: large, font color: white
  TextStyle buttonStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.roboto(
      decoration: textDecoration ?? TextDecoration.none,
      fontSize: fontSize ?? Dimensions.FONT_SIZE_LARGE,
      color: color ?? S.colors.white,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}

class _Shadow {
  final regShadow = [
    BoxShadow(
        blurRadius: 4,
        offset: const Offset(2, 2),
        color: S.colors.black.withOpacity(0.12)),
  ];

  final softShadow = [
    const BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 2),
    )
  ];

  final hardShadow=[
    const BoxShadow(
        blurRadius: 2,
        offset: Offset(2, 2)
    ),
    const BoxShadow(
        blurRadius: 2,
        offset: Offset(4, 0)
    ),
  ];

}