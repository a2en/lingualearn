import 'package:flutter/material.dart';
import 'package:lingualearn/core/constants/app_colors.dart';
import 'package:lingualearn/provider.dart';
import 'package:provider/provider.dart';
import 'package:lingualearn/ui/router.dart' as rt;
import 'core/constants/app_constants.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

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
          fontFamily: "Montserrat",
            scaffoldBackgroundColor: primaryColor
        ),
        initialRoute: RoutePaths.Splash,
        navigatorKey: NavigationService.navigationKey,
        onGenerateRoute: rt.Router.generateRoute,
      ),
    );
  }
}