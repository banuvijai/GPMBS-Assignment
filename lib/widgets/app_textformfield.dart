import 'package:flutter/material.dart';
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
    return Container(
      height: 60,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: S.colors.white,
      border: Border.all(color: S.colors.grey),
      borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextFormField(
          onChanged:onChanged,
          controller: controller,
          maxLines: maxLine??1,
          readOnly: isReadOnly!,
          keyboardType: textInputType??TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: Icon(rightPaddingIcon,size: 30,),
             floatingLabelBehavior: FloatingLabelBehavior.never,
            border:InputBorder.none,
            hintMaxLines: 4,
            alignLabelWithHint: true,
             contentPadding: const EdgeInsets.all(25.0),
            labelText: hint??'Search',
            labelStyle: S.textStyles.hintStyle,
          ),
        ),
      ),
    );
  }

}

