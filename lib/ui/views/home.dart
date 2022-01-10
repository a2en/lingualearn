import 'package:flutter/material.dart';
import 'package:lingualearn/core/constants/app_colors.dart';
import 'package:lingualearn/core/viewmodels/views/home_viewmodel.dart';
import 'package:lingualearn/services/auth_service.dart';
import 'package:lingualearn/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create:(context) => HomeViewModel(Provider.of<FirebaseService>(context,listen: false)),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            buildHeader(context),
            const SizedBox(
              height: 10,
            ),
            buildDropDown(),
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 50,),
            const Text(
              "Click call button to search for partners",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              onPressed: () {  },
              child:const Text("CALL", style: TextStyle(fontSize: 18,color: Colors.white),)
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage:
            NetworkImage(Provider
                .of<User?>(context)
                ?.photoURL! ?? ""),
            backgroundColor: Colors.transparent,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Lingua Learn",
            style: TextStyle(
                color: secondaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }

  Widget buildDropDown() {
    return Consumer<HomeViewModel>(
      builder: (context,model,child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: DropdownButtonFormField(
            value: model.selectedLanguage,
            alignment: Alignment.center,
            isExpanded: true,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true),
            onChanged: (String? value) {
              setState(() {
                model.selectedLanguage = value ?? "Spanish";
              });
            },
            icon: const Icon(Icons.keyboard_arrow_down),
            items: model.languages.map((String lang) {
              return DropdownMenuItem<String>(
                value: lang,
                child: Text(
                  lang,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }).toList(),
          ),
        );
      }
    );
  }
}
