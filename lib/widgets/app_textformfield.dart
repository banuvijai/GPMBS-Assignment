import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:gpmbs/controllers/user/user_controller.dart';

import '../utils/dimensions.dart';
import '../utils/s.dart';
import 'app_widgets.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? head;
  final int? maxLine;
  final IconData? leftPaddingIcon;
  final IconData? rightPaddingIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final double? cardHeight;
  final bool? isReadOnly;
  Function? rightPaddingOnTap;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final OnChanged;
  final validator;
  AppTextFormField({Key? key,this.controller,this.head,this.maxLine,this.hint,this.textInputType,this.leftPaddingIcon,this.rightPaddingIcon,this.initialValue,this.cardHeight,
    this.isReadOnly=false,this.rightPaddingOnTap,this.enabledBorderColor,this.focusedBorderColor,this.validator,this.OnChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL_6,left: Dimensions.PADDING_SIZE_EXTRA_SMALL_2,bottom: Dimensions.PADDING_SIZE_SMALL),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: S.colors.white,
        borderRadius: BorderRadius.circular(15)),

        child: TextFormField(
          onChanged:OnChanged,
          controller: controller,
          maxLines: maxLine??1,
          readOnly: isReadOnly!,
          keyboardType: textInputType??TextInputType.text,
          validator: (input) => input!.isEmpty? validator:'',
          decoration: InputDecoration(
            suffixIcon: Icon(rightPaddingIcon),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: S.colors.grey,
              ),
            ),
            hintMaxLines: 4,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            labelText: hint??'Search',
            labelStyle: S.textStyles.hintStyle,
          ),
        ),
      ),
    );
  }

}

