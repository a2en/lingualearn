import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

double getTopPadding(BuildContext context) {
  double h = MediaQuery.of(context).padding.top - kToolbarHeight;
  if (h.isNegative) {
    return MediaQuery.of(context).padding.top;
  }
  return h;
}

String validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null) {
    return "Enter a valid email address";
  } else {
    return "";
  }
}

int getPlatform() {
  int type=0;
  if (Platform.isAndroid) {
    type = 1;
  } else if (Platform.isIOS) {
    type = 2;
  }
  return type;
}

