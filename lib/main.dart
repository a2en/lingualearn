import 'package:flutter/material.dart';
import 'package:lingualearn/provider.dart';
import 'package:provider/provider.dart';
import 'package:lingualearn/ui/router.dart' as rt;
import 'data/constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: RoutePaths.Login,
        onGenerateRoute: rt.Router.generateRoute,
      ),
    );
  }
}