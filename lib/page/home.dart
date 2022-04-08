import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';
import 'package:lifetap_code_challenge/widgets/atoms/button.dart';
import 'package:lifetap_code_challenge/widgets/organisms/country_picker.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

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
                onPressed: () => showCountryPicker(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showCountryPicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CountryPicker(),
      ),
    );
  }
}
