import 'package:flutter/material.dart';
import 'package:hey_you_app/constants/routes.dart';
import 'package:hey_you_app/screens/bootstrap/widgets/spinner.dart';
import 'package:hey_you_app/utilities/colors_palette.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BootstrapScreen extends StatefulWidget {
  @override
  _BootstrapScreenState createState() => _BootstrapScreenState();
}

class _BootstrapScreenState extends State<BootstrapScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _auth.currentUser().then((user) {
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(context, SIGN_IN_ROUTE, (_) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, HOME_ROUTE, (_) => false);
      }
    }).catchError((_) {
      Navigator.pushNamedAndRemoveUntil(context, SIGN_IN_ROUTE, (_) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.oldRose,
      body: Center(
        child: Spinner(),
      ),
    );
  }
}
