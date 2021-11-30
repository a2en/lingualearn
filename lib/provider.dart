import 'package:lingualearn/services/auth_service.dart';
import 'package:lingualearn/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';


List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Authentication()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Authentication, FirebaseService>(
    update: (context, authentication, firebaseService) =>
        FirebaseService(authentication),
  )
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User?>(
    initialData:null,
    create: (context) =>
    Provider.of<Authentication>(context, listen: false).user,
  )
];
