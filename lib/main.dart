import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recolt_app/home.dart';
import 'package:recolt_app/assets/colors/design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';
import 'package:recolt_app/collaborateur/collaborateur.dart';
import 'package:recolt_app/collaborateur/decouvrir/accueil.dart';
import 'package:recolt_app/collaborateur/commandes/commandes.dart';
import 'package:recolt_app/collaborateur/profil/profil.dart';
import 'package:recolt_app/collaborateur/swap/swap.dart';
void main() {
  runApp(MaterialApp(
    home: const SplashScreen(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => const Home(),
      '/Collaborateur': (BuildContext context) => const Collaborateur(),
      '/Accueil': (BuildContext context) => const Accueil(),
      '/Commandes': (BuildContext context) => const Commandes(),
      '/Profil': (BuildContext context) => const Profil(),
      '/Swap': (BuildContext context) => const Swap(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("0xff$primaryCta")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0), 
              padding:const EdgeInsets.fromLTRB(5, 5, 5, 5),     
              child: Image.asset('images/recoltlogo.png', height: 130, width: 240, ),
              
              alignment: Alignment.centerLeft,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: StyledText(
              text: '<bold>co</bold>nnecter',
              tags: {'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold))},
              style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryBg"))),
              
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: StyledText(
              text: '<bold>co</bold>llaborer',
              tags: {'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold))},
              style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryBg"))),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: StyledText(
              text: 'ré<bold>co</bold>lter',
              tags: {'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold))},
              style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryBg"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
