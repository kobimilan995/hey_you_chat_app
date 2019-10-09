import 'package:flutter/material.dart';
import 'package:hey_you_app/utilities/colors_palette.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;

  CustomButton({
    @required this.text,
    @required this.onPressed,
    @required this.isLoading,
    this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        color: ColorsPalette.blackCoral,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    ColorsPalette.lavenderMist,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: ColorsPalette.lavenderMist,
                ),
              ),
      ),
    );
  }
}
