import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.blueGrey,
          textTheme: TextTheme(
            headline1: GoogleFonts.monoton(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
            headline2: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
            headline3: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
            headline4: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
        ),
        initialRoute: LOginpage.path,
        routes: {
          LOginpage.path: (context) => LOginpage(),
        });
  }
}
