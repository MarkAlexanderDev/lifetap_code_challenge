import 'package:flutter/material.dart';
import 'package:lifetap_code_challenge/models/country.dart';
import 'package:lifetap_code_challenge/modules/countries.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';
import 'package:lifetap_code_challenge/widgets/atoms/country_tag.dart';
import 'package:lifetap_code_challenge/widgets/atoms/dragger.dart';
import 'package:lifetap_code_challenge/widgets/molecules/country_searcher.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  List<ModelCountry> selectedCountries = [];
  List<ModelCountry> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    if (filteredCountries.isEmpty) filteredCountries = countries;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              color: MyColors.backgroundDark,
            ),
            child: Column(
              children: [
                const MyDragger(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "Selected counties",
                    style: MyTextStyles.h3.copyWith(
                      color: MyColors.text,
                    ),
                  ),
                ),
                Wrap(
                  children: selectedCountries
                      .map(
                        (ModelCountry country) => CountryTag(
                          title: country.name,
                          onRemove: () => setState(() {
                            selectedCountries.removeWhere(
                                (element) => element.name == country.name);
                          }),
                        ),
                      )
                      .toList(),
                  clipBehavior: Clip.hardEdge,
                ),
                CountrySearcher(
                  filteredCountries: filteredCountries,
                  selectedCountries: selectedCountries,
                  onSearch: (String value) {
                    setState(() {
                      filteredCountries = countries
                          .where((country) => country.name
                              .toLowerCase()
                              .startsWith(value.toLowerCase()))
                          .toList();
                    });
                  },
                  onAdd: (ModelCountry country) {
                    setState(() {
                      selectedCountries.add(country);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
