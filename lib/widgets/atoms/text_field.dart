import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  final Function onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      cursorColor: MyColors.text,
      style: MyTextStyles.h3.copyWith(
        color: MyColors.text,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.search,
          color: MyColors.grey,
          size: 24,
        ),
        fillColor: MyColors.containerDark,
        hoverColor: Colors.transparent,
        filled: true,
        hintStyle: MyTextStyles.h3.copyWith(
          color: MyColors.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hint,
      ),
      onChanged: (String value) => onChanged(value),
    );
  }
}
