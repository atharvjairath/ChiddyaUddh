import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'modes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome to Chiddya उड़",
          body:
          "Get Started by following this guide!",
          image: Align(
            child: Image.asset('assets/namaste.png', width: 350.0, height: 250,),
            alignment: Alignment.bottomCenter),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Connect Your Device",
          body:
          "Make sure your device is connected to stable WIFI!",
          image: Align(
              child: Image.asset('assets/delivery.png', width: 350.0, height: 250,),
              alignment: Alignment.bottomCenter),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Modes!",
          body:
          "We have 2 Modes for you to play from! ",
          image: Align(
              child: Image.asset('assets/digital-nomad.png', width: 350.0, height: 220,),
              alignment: Alignment.bottomCenter),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Chiddya उड़!",
          body: "This is our game mode where you get your 4 friend to re live the chidya udhi days!",
          image: Align(
              child: Image.asset('assets/games-time.png', width: 350.0, height: 220,),
              alignment: Alignment.bottomCenter),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Quiz Mode!",
          body: "This is our Quiz mode where we have a fun competion between friends ",
          image: Align(
              child: Image.asset('assets/concept-of-unknown-things.png', width: 350.0, height: 220,),
              alignment: Alignment.bottomCenter),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
