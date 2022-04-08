import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';
import 'package:lifetap_code_challenge/widgets/atoms/button.dart';

import 'logic.dart';

class PageHome extends StatelessWidget {
  PageHome({Key? key}) : super(key: key);

  final HomeLogic logic = HomeLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF000000),
            Color(0xFF140514),
            Color(0xFF3A0F3A),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            children: [
              Text(
                "Country picker case study for LifeTap",
                style: MyTextStyles.h1.copyWith(
                  color: MyColors.text,
                ),
              ),
              const Spacer(),
              MyButton(
                child: Text(
                  "Start",
                  style: MyTextStyles.h1.copyWith(
                    color: MyColors.text,
                  ),
                ),
                onPressed: () => logic.showCountryPicker(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
