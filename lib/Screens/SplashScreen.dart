import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';
import 'HomePage.dart';
import 'LoginPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }

  _checkLoginState() async {
    final authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;

    await Future.delayed(Duration(seconds: 3));

    if (user != null) {
      authProvider.setLoggedIn(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      authProvider.setLoggedIn(false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Your Splash Screen content
        ],
      ),
    );
  }
}
