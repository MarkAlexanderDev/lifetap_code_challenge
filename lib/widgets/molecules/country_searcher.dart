import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:lifetap_code_challenge/models/country.dart';
import 'package:lifetap_code_challenge/modules/styles/colors.dart';
import 'package:lifetap_code_challenge/modules/styles/text_styles.dart';
import 'package:lifetap_code_challenge/widgets/atoms/text_field.dart';

class CountrySearcher extends StatelessWidget {
  CountrySearcher({
    Key? key,
    required this.filteredCountries,
    required this.selectedCountries,
    required this.onSearch,
    required this.onAdd,
  }) : super(key: key);

  final List<ModelCountry> filteredCountries;
  final List<ModelCountry> selectedCountries;
  final void Function(String value) onSearch;
  final void Function(ModelCountry country) onAdd;

  final scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyTextField(
            hint: "Seach",
            onChanged: onSearch,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClickableListWheelScrollView(
                scrollController: scrollController,
                onItemTapCallback: (index) {
                  if (!selectedCountries.contains(filteredCountries[index]) &&
                      selectedCountries.length < 6) {
                    onAdd(filteredCountries[index]);
                  }
                },
                itemHeight: 30,
                itemCount: filteredCountries.length,
                child: ListWheelScrollView.useDelegate(
                  controller: scrollController,
                  itemExtent: 30,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.3,
                  perspective: 0.007,
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              filteredCountries[index].code,
                              style: MyTextStyles.h2.copyWith(
                                color: MyColors.text,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              filteredCountries[index].name,
                              style: MyTextStyles.h2.copyWith(
                                color: MyColors.text,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: filteredCountries.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
