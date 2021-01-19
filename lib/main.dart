import 'welcome.dart';
import 'wrapper.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import './auth.dart';
import './user.dart';

void main() {
  runApp(new MaterialApp(
    home: Hackathon(),
  ));
}

class Hackathon extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Hackathon> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new Hackathon1(),
      title: new Text(
        'चिड़िया उड़',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.deepPurple),
      ),
      image: new Image.asset('assets/bird.gif'),
      backgroundColor: Colors.white,
      loaderColor: Colors.deepPurple,
      photoSize: 200.0,
    );
  }
}

class Hackathon1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
    // return MaterialApp(
    //   theme: ThemeData.dark().copyWith(
    //     primaryColor: Colors.white,
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   home: welcome(),
    //   debugShowCheckedModeBanner:false,
    // );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
