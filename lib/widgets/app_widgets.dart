import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/dimensions.dart';
import '../utils/s.dart';

class AppWidgets{

  static PreferredSizeWidget appBar(
      String title, {
        double? fSize,
        Color? fColor,
        Color? bgColor,
        FontWeight? fWeight,
        List<Widget>? actions,
        Widget? leading,
        bool? centerTitle,
        PreferredSizeWidget? bottom,
        Widget? flexibleSpace,
      }) {
    return AppBar(
      title: Text(
        title,
        style: S.textStyles.titleTextStyle(
          color: fColor??Colors.black,
          fontSize: fSize,
          fontWeight: fWeight??FontWeight.w700,
        ),
      ),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle ?? true,
      backgroundColor: S.colors.white,
      elevation: 0,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
    );
  }


  static Widget backButtonWithTap(
      {Color? color, double? size, Function? onTap, dynamic result}) {
    return GestureDetector(
      onTap: ()=>onTap!.call(),
      child: Container(
        padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
        child: Icon(
          Platform.isIOS?Icons.arrow_back_ios:Icons.arrow_back,
          color: color ?? Colors.black,
          size: size ?? 24,
        ),
      ),
    );
  }

  //loading dialog
  static void loadingDialog() {
    Get.dialog(loadingWidget(),barrierDismissible: false);
  }

  //hide the dialog
  static void hideDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }


  static Widget loadingWidget(){
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(S.colors.grey),
          strokeWidth: 1.2,
        ),
      ),
    );
  }

  static Widget buildText({required String? text,TextAlign? textAlign,TextStyle? textStyle,
    TextOverflow? overflow,int? maxLines,bool? softWrap}) {
    return Text(
      text!,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign??TextAlign.start,
      style:textStyle?? S.textStyles.normalTextStyle(),
    );
  }

}