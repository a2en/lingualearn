import 'package:flutter/material.dart';
import 'package:lingualearn/core/constants/app_colors.dart';
import 'package:lingualearn/core/viewmodels/views/login_viewmodel.dart';
import 'package:lingualearn/services/firebase_service.dart';
import 'package:lingualearn/ui/widgets/base_widget.dart';
import 'package:lingualearn/ui/widgets/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
        model: LoginViewModel(Provider.of<FirebaseService>(context)),
        child: const TopHeader(),
        builder: (context, model, child) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: model.busy
                      ? const Center(
                        child:  SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                      )
                      : const GoogleSignInButton(),
                ),
                
              ],
            ),
          );
        });
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Text(
            "Lingua Learn",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Login or sign up to continue",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

