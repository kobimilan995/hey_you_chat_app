import 'package:flutter/material.dart';
import 'package:hey_you_app/constants/routes.dart';
import 'package:hey_you_app/screens/bootstrap/bootstrap_screen.dart';
import 'package:hey_you_app/screens/home/home_screen.dart';
import 'package:hey_you_app/screens/signIn/sign_in_screen.dart';
import 'package:hey_you_app/utilities/authentication_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationService authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: BOOTSTRAP_ROUTE,
      routes: {
        BOOTSTRAP_ROUTE: (context) => BootstrapScreen(),
        SIGN_IN_ROUTE: (context) => SignInScreen(authService: authService),
        HOME_ROUTE: (context) => HomeScreen(authService: authService),
      },
    );
  }
}
