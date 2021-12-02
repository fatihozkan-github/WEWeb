import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_web/UI/design_material/DM_colors.dart';

class RoundedTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function? onEditingComplete;
  final String? initialValue;
  final bool showIcon;
  final int? maxLines;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final Widget? customPrefixIcon;
  final TextCapitalization textCapitalization;

  /// • For a password field with a toggle button do NOT use [TextInputAction.next], instead consider the following:
  ///
  /// {@tool snippet}
  ///             onEditingComplete: () {
  ///                FocusScope.of(context).nextFocus();
  ///                FocusScope.of(context).nextFocus();
  ///             },
  /// {@end-tool}
  RoundedTextField({
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.onEditingComplete,
    this.initialValue,
    this.showIcon = true,
    this.maxLines = 1,
    this.padding,
    this.controller,
    this.customPrefixIcon,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: 1,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType,
        cursorColor: UIColors.primaryColor,
        obscureText: obscureText,
        // onEditingComplete: onEditingComplete,
        autocorrect: false,
        textCapitalization: textCapitalization,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: showIcon
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: customPrefixIcon != null ? customPrefixIcon : Icon(icon, color: UIColors.primaryColor))
              : null,
          suffixIcon: suffixIcon,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.orange, width: 2.0),
          ),
          // border: InputBorder.none,
        ),
      ),
    );
  }
}
