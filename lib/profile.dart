import 'package:chiddiya_udd/modes.dart';
import 'package:flutter/material.dart';
import 'package:liquid_ui/liquid_ui.dart';
import 'quiz_topics.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:slimy_card/slimy_card.dart';
import 'auth.dart';
import 'package:provider/provider.dart';
import './database.dart';
import 'user.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidApp(
      materialApp: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chiddiya Udd',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        home: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SideMenu(
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
              'Chiddiya Udd',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: StreamBuilder(
            initialData: false,
            stream: slimyCard.stream,
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 100),
                  SlimyCard(
                    topCardWidget: topCardWidget('assets/birdie.png'),
                    bottomCardWidget: bottomCardWidget(),
                    slimeEnabled: true,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget topCardWidget(String imagePath) {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(imagePath)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                userData.name,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 15),
              Text(
                'View your stats below!',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
            ],
          );
        });
  }

  Widget bottomCardWidget() {
    User user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Text(
            'Wins: ${userData.win}  \nLosses: ${userData.losses} ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          );
        });
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Modes()),
                    );
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
                    "Chiddiya Uddi",
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
