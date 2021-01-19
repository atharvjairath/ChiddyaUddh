import './login.dart';
import 'package:provider/provider.dart';
import './user.dart';
import './modes.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return welcome();
    } else {
      return MyApp();
    }
  }
}
