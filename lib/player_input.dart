import 'package:chiddiya_udd/chidya_scoreboard.dart';
import 'package:flutter/material.dart';
import 'FadeAnimation2.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'profile.dart';
import 'auth.dart';
import 'quiz_topics.dart';
import 'package:provider/provider.dart';
import './database.dart';
import './user.dart';
import 'app_theme.dart';

class playerinput extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
      materialApp: MaterialApp(
        title: 'चिड़िया उड़',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: playerinput(),
      ),
    );
  }
}

class _ScreenState extends State<playerinput> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final AuthService _auth = AuthService();
  String name1,name2,name3,name4;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SideMenu(
        key: _endSideMenuKey,
        inverse: true, // end side menu
        background: Colors.green[700],
        type: SideMenuType.slideNRotate,
        menu: buildMenu(),
        child: SideMenu(
          key: _sideMenuKey,
          menu: buildMenu(),
          type: SideMenuType.slideNRotate,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  final _state = _sideMenuKey.currentState;
                  if (_state.isOpened)
                    _state.closeSideMenu();
                  else
                    _state.openSideMenu();
                },
              ),
              title: Text(
                'चिड़िया उड़',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children:<Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1,
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: <Widget>[
                                  FadeAnimation(
                                    1,
                                    Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage("assets/birdie.png"),
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Enter Player Names :",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      FadeAnimation(
                                        1,
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.transparent,
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (val){
                                                    setState(() {
                                                      name1=val;
                                                  });},
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Player 1",
                                                    hintStyle:
                                                    TextStyle(color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (val){
                                                    setState(() {
                                                      name2=val;
                                                    });},
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Player 2",
                                                    hintStyle:
                                                    TextStyle(color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (val){
                                                    setState(() {
                                                      name3=val;
                                                    });},
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Player 3",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey)),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  onChanged: (val){
                                                    setState(() {
                                                      name4=val;
                                                    });},
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Player 4",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      FadeAnimation(
                                        1,
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(horizontal: 60),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Color.fromRGBO(49, 39, 79, 1),
                                          ),
                                          child: Center(
                                              child: Expanded(
                                                child: Container(
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                    color: DesignCourseAppTheme.nearlyBlue,
                                                    borderRadius: const BorderRadius.all(
                                                      Radius.circular(16.0),
                                                    ),
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: DesignCourseAppTheme
                                                              .nearlyBlue
                                                              .withOpacity(0.5),
                                                          offset: const Offset(1.1, 1.1),
                                                          blurRadius: 10.0),
                                                    ],
                                                  ),
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => chidiyascorebaord(name1:name1,name2:name2,name3:name3,name4:name4)),
                                                      );
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        "Start Game!",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 18,
                                                          letterSpacing: 0.0,
                                                          color: DesignCourseAppTheme
                                                              .nearlyWhite,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 12.0),
                                  // Text(
                                  //   error,
                                  //   style: TextStyle(
                                  //       color: Colors.red, fontSize: 14.0),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   elevation: 20,
            //   onPressed: () {},
            //   child: Icon(Icons.bluetooth,
            //   color: Colors.black,
            //   size: 30,),
            //   backgroundColor: Colors.blue,
            // ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      SizedBox(height: 16.0),
                      LText(
                        "\l.lead{Hello,}\n\l.lead.bold{${userData.name}}",
                        baseStyle: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () {
                    final _state = _sideMenuKey.currentState;
                    if (_state.isOpened)
                      _state.closeSideMenu();
                    else
                      _state.openSideMenu();
                  },
                  leading: Icon(Icons.home_outlined,
                      size: 34.0, color: Colors.white),
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()),
                    );
                  },
                  leading: Icon(Icons.verified_user_outlined,
                      size: 28.0, color: Colors.white),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => playerinput()),
                    );
                  },
                  leading: Icon(Icons.gamepad_outlined,
                      size: 30.0, color: Colors.white),
                  title: Text(
                    "चिड़िया उड़",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => quizTopics()),
                    );
                  },
                  leading: Icon(Icons.question_answer_outlined,
                      size: 30.0, color: Colors.white),
                  title: Text(
                    "Quiz",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () {},
                  leading:
                  Icon(Icons.star_border, size: 30.0, color: Colors.white),
                  title: Text(
                    "Help & Support",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                LListItem(
                  backgroundColor: Colors.transparent,
                  onTap: () async {
                    await _auth.signOut();
                  },
                  leading:
                  Icon(Icons.exit_to_app, size: 30.0, color: Colors.white),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
              ],
            ),
          );
        });
  }
}
