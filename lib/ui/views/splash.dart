import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingualearn/core/constants/app_constants.dart';
import 'package:lingualearn/services/auth_service.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () async{
      bool isLoggedIn = await Provider.of<Authentication>(context,listen: false).isLoggedIn();
      if (isLoggedIn) {
        navService.pushNamed(RoutePaths.Home);
      } else {
        navService.pushNamed(RoutePaths.Login);
      }
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
