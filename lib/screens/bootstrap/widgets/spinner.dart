import 'package:flutter/material.dart';
import 'package:hey_you_app/utilities/colors_palette.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(ColorsPalette.blackCoral),
      ),
    );
  }
}
