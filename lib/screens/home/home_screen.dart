import 'package:flutter/material.dart';
import 'package:hey_you_app/constants/routes.dart';
import 'package:hey_you_app/utilities/authentication_service.dart';
import 'package:hey_you_app/utilities/colors_palette.dart';

class HomeScreen extends StatefulWidget {
  final AuthenticationService authService;

  HomeScreen({@required this.authService});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _signOut() async {
    await widget.authService.signOut();
    Navigator.pushNamedAndRemoveUntil(context, SIGN_IN_ROUTE, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.oldRose,
      appBar: AppBar(
        backgroundColor: ColorsPalette.blackCoral,
        title: Text(
          'Hey You',
          style: TextStyle(
            color: ColorsPalette.lavenderMist,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: _showDialog,
            color: ColorsPalette.lavenderMist,
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome home!',
          style: TextStyle(
            color: ColorsPalette.lavenderMist,
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("You are about to logout!"),
          content: new Text("Are you sure?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(
                "No",
                style: TextStyle(
                  color: ColorsPalette.oldRose,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("Yes"),
              onPressed: _signOut,
            ),
          ],
        );
      },
    );
  }
}
