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
import 'player_input.dart';
class chidiyascorebaord extends StatefulWidget {
  final String name1,name2,name3,name4;
  chidiyascorebaord({Key key,this.name1,this.name2,this.name3,this.name4}): super(key: key);
  @override
  _ScreenState createState() => _ScreenState(name1:name1,name2:name2,name3: name3,name4:name4);
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
        home: chidiyascorebaord(),
      ),
    );
  }
}

class _ScreenState extends State<chidiyascorebaord> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final String name1,name2,name3,name4;

  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final AuthService _auth = AuthService();
  _ScreenState({@required this.name1,@required this.name2,@required this.name3,@required this.name4});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bgsocre.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Round : 1",
                                            style: TextStyle(
                                              fontSize: 50,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Card(
                                      color: Colors.green,
                                      elevation: 3,
                                      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.green,
                                          backgroundImage: AssetImage('assets/avatar.png'),

                                        ),
                                        title: Text(name1,style: TextStyle(fontWeight: FontWeight.bold)),
                                          subtitle: Text('Score:         15', style: TextStyle(fontWeight: FontWeight.bold))

                                      ),
                                    ),

                                    Card(
                                      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                      elevation: 3,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage('assets/avatar (1).png'),
                                        ),
                                        title: Text(name2,style: TextStyle(fontWeight: FontWeight.bold)),
                                          subtitle: Text('Score:         10', style: TextStyle(fontWeight: FontWeight.bold))

                                      ),
                                    ),

                                    Card(
                                      elevation: 3,
                                      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage('assets/avatar (2).png'),

                                        ),
                                          title: Text(name3,style: TextStyle(fontWeight: FontWeight.bold)),
                                          subtitle: Text('Score:         10', style: TextStyle(fontWeight: FontWeight.bold))

                                      ),
                                    ),

                                    Card(
                                      elevation: 3,
                                      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage('assets/avatar (3).png'),

                                        ),
                                          title: Text(name4,style: TextStyle(fontWeight: FontWeight.bold)),
                                          subtitle: Text('Score:         10', style: TextStyle(fontWeight: FontWeight.bold))

                                      ),
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
