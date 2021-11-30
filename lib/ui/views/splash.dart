import 'package:flutter/material.dart';
import 'package:lingualearn/core/constants/app_constants.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      navService.pushNamed(RoutePaths.Login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage('assets/images/icon.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Lingua Learn",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
