import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';

class CountryTag extends StatelessWidget {
  const CountryTag({
    Key? key,
    required this.title,
    required this.onRemove,
  }) : super(key: key);

  final String title;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.container,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: MyTextStyles.h4.copyWith(
                color: MyColors.text,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onRemove,
              child: const Icon(
                Icons.cancel,
                color: MyColors.text,
              ),
            )
          ],
        ),
      ),
    );
  }
}
