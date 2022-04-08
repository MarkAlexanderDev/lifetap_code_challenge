import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/widgets/organisms/country_picker.dart';

class HomeLogic {
  Future<void> showCountryPicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CountryPicker(),
      ),
    );
  }
}
