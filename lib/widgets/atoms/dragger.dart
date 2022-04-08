import 'package:flutter/cupertino.dart';

import '../../modules/styles/colors.dart';

class MyDragger extends StatelessWidget {
  const MyDragger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 5,
        width: 34,
        decoration: BoxDecoration(
          color: MyColors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
    );
  }
}
