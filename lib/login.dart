import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/pageRouteanimation.dart';
import 'package:flutter_application_2/registion.dart';

import 'golobleWidget.dart';

class LOginpage extends StatefulWidget {
  static const String path = 'Loginpage';
  const LOginpage({Key key}) : super(key: key);

  @override
  _LOginpageState createState() => _LOginpageState();
}

class _LOginpageState extends State<LOginpage> {
  bool _obsettext = true;
  var fromFey = GlobalKey<FormState>();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, bottom: 8),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.asset(
                      'assets/image.png',
                    ),
                  ),
                ),
                Text(
                  'signIn',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Form(
                  key: fromFey,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      children: [
                        TextFromField(
                          controller: emailcontroler,
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
                          controller: passwordcontroler,
                          obsettext: _obsettext,
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
                              // ignore: unnecessary_statements
                              setState(() {
                                _obsettext = !_obsettext;
                              });
                            },
                            child: Icon(
                              _obsettext
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
                        SizedBox(
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
                                  UserCredential userCredential =
                                      await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                              email: emailcontroler.text,
                                              password: passwordcontroler.text);
                                  if (userCredential.user.email != null) {
                                    Navigator.of(context)
                                        .push(createdroute(Homepage()));
                                    toast('Thanks for login Enjoy This app');
                                  }
                                } catch (e) {
                                  print('Erro');
                                  toast('Please enter your vlaid email');
                                }
                              }
                            },
                            child: Text(
                              'signin',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(createdroute(Registration()));
                        },
                        child: Text(
                          'New Registration',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
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
