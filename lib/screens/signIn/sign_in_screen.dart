import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hey_you_app/constants/routes.dart';
import 'package:hey_you_app/utilities/authentication_service.dart';
import 'package:hey_you_app/utilities/colors_palette.dart';
import 'package:hey_you_app/widgets/reusables/buttons/custom_button.dart';

class SignInScreen extends StatefulWidget {
  final AuthenticationService authService;

  SignInScreen({@required this.authService});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  void submitLoginForm() async {
    setState(() {
      isLoading = true;
    });
    try {
      FirebaseUser user = await widget.authService.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // set user in provider

      Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (_) => false);
    } catch (_) {
      // show toast error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.oldRose,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTextInput(
              hintText: 'Enter email',
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            buildTextInput(
              hintText: 'Enter password',
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            BlackCoralButton(
              text: 'Sign In',
              onPressed: submitLoginForm,
              isLoading: isLoading,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    thickness: 2.0,
                    color: ColorsPalette.lavenderMist,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    color: ColorsPalette.lavenderMist,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Divider(
                    thickness: 2.0,
                    color: ColorsPalette.lavenderMist,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextInput({
    @required String hintText,
    @required TextEditingController controller,
    bool obscureText = false,
  }) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsPalette.oldRose,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
    );
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: ColorsPalette.blackCoral,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsPalette.lavenderMist,
        focusedBorder: border,
        border: border,
        enabledBorder: border,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorsPalette.lightTaupe,
        ),
      ),
    );
  }
}
