import 'dart:async';

import 'package:apptoeic/student/StudentMainPage.dart';
import 'package:flutter/material.dart';
import '../../utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 3), () {
      // sp.isSignedIn == false
      //     ? nextScreen(context, LoginScreen())
      //     : nextScreen(context, const HomeScreen());
      // print(sp.role);
      // if (sp.role == 1) {
      //   nextScreenReplace(context, const MainPageAdmin());
      // } else if (sp.role == 2) {
      //   nextScreenReplace(context, const MainPageStaff());
      // } else {
      //   nextScreenReplace(context, const MainPage());
      // }
      nextScreen(context, StudentMainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            //color: Color.fromRGBO(117, 132, 103, 1),
            color: Colors.white,
            child: const Center(
                child: Image(
              image: AssetImage('assets/events/sukien1.jpg'),
              height: 80,
              width: 80,
            ))));
  }
}
