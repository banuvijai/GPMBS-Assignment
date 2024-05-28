import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpmbs/utils/dimensions.dart';

class S{
  static final colors=_Colors();
  static final textStyles=_TextStyle();
  static final font=_Font();
}

class _Font{
  static const path='assets/fonts';
  String oxygen='$path/Oxygen-Regular.ttf';
}

class _Colors {
  Color colorPrimary = const Color(0xe0828282);
  Color black = const Color(0xe0000000);
  Color white = const Color(0xeFFFFFFF);
  Color circleAvatarColor = const Color(0xe0828282);

  Color colorTransparent = const Color(0x00000000);
  Color hint = Colors.grey;

  Color grey = const Color(0xe0354052);
  Color greyShade = const Color(0XFFB9BBB6);
  Color lightGrey = const Color(0xFFD9D9D9);

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

}

