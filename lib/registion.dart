import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/pageRouteanimation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'golobleWidget.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _obstext = true;
  var fromFey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwodcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    toast(text) {
      return scaffold.showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 8),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(
                      'assets/image2.png',
                    ),
                  ),
                ),
                Text(
                  'signUp',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Form(
                  key: fromFey,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: [
                        TextFromField(
                          controller: emailcontroller,
                          obsettext: false,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.length == 0) {
                              return ('Email is required');
                            }
                          },

                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          fildname: 'Your Email',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFromField(
                          controller: passwodcontroller,
                          obsettext: _obstext,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.length < 8) {
                              return ('please type 8 key');
                            }
                          },

                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obstext = !_obstext;
                              });
                            },
                            child: Icon(
                              _obstext
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          fildname: 'Password',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () async {
                        if (fromFey.currentState.validate()) {
                          fromFey.currentState.save();
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwodcontroller.text,
                            );
                            if (userCredential.user.email != null) {
                              toast('Registration complate Enjoy this App');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LOginpage()));
                            }
                          } catch (e) {
                            toast('Already registration complate this email');
                          }
                        }
                      },
                      child: Text(
                        'signUp',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
