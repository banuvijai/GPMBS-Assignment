import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import '../utils/s.dart';

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
  final Function? rightPaddingOnTap;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AppTextFormField({super.key,this.controller,this.head,this.maxLine,this.hint,this.textInputType,this.leftPaddingIcon,this.rightPaddingIcon,this.initialValue,this.cardHeight,
    this.isReadOnly=false,this.rightPaddingOnTap,this.enabledBorderColor,this.focusedBorderColor,this.validator,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall6,left: Dimensions.paddingSizeExtraSmall2,bottom: Dimensions.paddingSizeSmall),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: S.colors.white,
        borderRadius: BorderRadius.circular(15)),

        child: TextFormField(
          onChanged:onChanged,
          controller: controller,
          maxLines: maxLine??1,
          readOnly: isReadOnly!,
          keyboardType: textInputType??TextInputType.text,
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

