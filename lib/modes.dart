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
import 'player_input.dart';

class Modes extends StatefulWidget {
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
        home: Modes(),
      ),
    );
  }
}

class _ScreenState extends State<Modes> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final AuthService _auth = AuthService();
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
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: 'ishaanbhai',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => playerinput()),
                                );
                              },
                              child: Container(
                                height: 220,
                                width: 350,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage('assets/Group1.png'),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[400],
                                          blurRadius: 10,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              FadeAnimation(
                                                  1,
                                                  Text(
                                                    "Chidiya उड़",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              FadeAnimation(
                                                  1.1,
                                                  Text(
                                                    "Rejoice your memories \nand check your reflex \nactions!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        // FadeAnimation(1.2, Container(
                                        //   width: 35,
                                        //   height: 35,
                                        //   decoration: BoxDecoration(
                                        //       shape: BoxShape.circle,
                                        //       color: Colors.white
                                        //   ),
                                        //   child: Center(
                                        //     child: Icon(Icons.favorite_border, size: 20,),
                                        //   ),
                                        // ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Hero(
                            tag: 'aastha',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => quizTopics()),
                                );
                              },
                              child: Container(
                                height: 220,
                                width: 350,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage('assets/Group2.png'),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[400],
                                          blurRadius: 10,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              FadeAnimation(
                                                  1,
                                                  Text(
                                                    "Quiz",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              FadeAnimation(
                                                  1.1,
                                                  Text(
                                                    "Test your knowledge, \nthe fun way!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        // FadeAnimation(1.2, Container(
                                        //   width: 35,
                                        //   height: 35,
                                        //   decoration: BoxDecoration(
                                        //       shape: BoxShape.circle,
                                        //       color: Colors.white
                                        //   ),
                                        //   child: Center(
                                        //     child: Icon(Icons.favorite_border, size: 20,),
                                        //   ),
                                        // ))
                                      ],
                                    ),
                                  ],
                                ),
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
                  onTap: () {},
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
