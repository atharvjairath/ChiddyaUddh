import 'package:flutter/material.dart';
import 'FadeAnimation.dart';
import 'app_theme.dart';
import 'auth.dart';
import 'loading.dart';
import 'introudction.dart';
class signup extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  String password = "";
  bool loading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: FadeAnimation(
                  1,
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/1.png"),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Get Started!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
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
                        Form(
                          key: _formKey,
                          child: Column(
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
                                          validator: (val) => val.isEmpty
                                              ? 'Enter an name'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => name = val);
                                          },
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Name",
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
                                          style: TextStyle(color: Colors.black),
                                          validator: (val) => val.isEmpty
                                              ? 'Enter an email'
                                              : null,
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
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
                                          onChanged: (val) {
                                            setState(() => password = val);
                                          },
                                          style: TextStyle(color: Colors.black),
                                          validator: (val) => val.length < 6
                                              ? 'Enter a password 6+ chars long'
                                              : null,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                          obscureText: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                height: 20.0,
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
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() => loading = true);
                                            dynamic result = await _auth
                                                .registerWithEmailAndPassword(
                                                    email, password, name);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => App()),
                                            );
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    'Please supply a valid email';
                                              });
                                            }
                                          }
                                        },
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
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
                // FadeAnimation(
                //   1,
                //   Container(
                //     height: 50,
                //     margin: EdgeInsets.symmetric(horizontal: 60),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //       color: Color.fromRGBO(49, 39, 79, 1),
                //     ),
                //     child: Center(
                //       child:Expanded(
                //         child:
                //         Container(
                //           height: 48,
                //           decoration: BoxDecoration(
                //             color: DesignCourseAppTheme.nearlyBlue,
                //             borderRadius: const BorderRadius.all(
                //               Radius.circular(16.0),
                //             ),
                //             boxShadow: <BoxShadow>[
                //               BoxShadow(
                //                   color: DesignCourseAppTheme
                //                       .nearlyBlue
                //                       .withOpacity(0.5),
                //                   offset: const Offset(1.1, 1.1),
                //                   blurRadius: 10.0),
                //             ],
                //           ),
                //           child: FlatButton(
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => user()));
                //             },
                //             child:Center(
                //               child: Text(
                //                 "SignUp",
                //                 textAlign: TextAlign.left,
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 18,
                //                   letterSpacing: 0.0,
                //                   color: DesignCourseAppTheme
                //                       .nearlyWhite,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //
                //
                //
                //       /*MaterialButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => user()));
                //         },
                //         child: Text(
                //           "SignUp",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),*/
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
