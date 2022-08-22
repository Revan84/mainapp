import 'package:flutter/material.dart';

import 'package:recolt_app/assets/colors/design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(int.parse("0xff$secondaryBg")),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children:  [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                            child: StyledText(
                            text: '<style>Qui va là?<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 30))},
                            style: GoogleFonts.katibeh(color: Color(int.parse("0xff$secondaryCta"))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: StyledText(
                            text: '<style>Vous êtes un<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryCta"))),
                          ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    primary: Color(int.parse("0xff$primaryCta")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: StyledText(
                    text: '<style>récolteur<style>',
                    tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal))},
                    style: GoogleFonts.katibeh(color: Color(int.parse("0xff$primaryBg"))),
                  ),
                ),
              ),
            Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: StyledText(
                      textAlign: TextAlign.center,
                            text: '<style>Vous faites vos courses chez les producteurs et vous organisez en communauté pour mieux manger via la commande groupée.<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryCta"))),
                          ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: StyledText(
                            text: '<style>Vous êtes un<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$secondaryCta"))),
                          ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    primary: Color(int.parse("0xff$secondaryCta")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: StyledText(
                    text: '<style>producteur<style>',
                    tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal))},
                    style: GoogleFonts.katibeh(color: Color(int.parse("0xff$primaryBg"))),
                  ),
                ),
              ),
            Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: StyledText(
                      textAlign: TextAlign.center,
                            text: '<style>Vous souhaiter vendre vos produits via la commande groupée et augmenter vos nombre de clients.<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$secondaryCta"))),
                          ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: StyledText(
                            text: '<style>Vous êtes un<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryText"))),
                          ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Collaborateur');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    primary: Color(int.parse("0xff$primaryText")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: StyledText(
                    text: '<style>collaborateur<style>',
                    tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal))},
                    style: GoogleFonts.katibeh(color: Color(int.parse("0xff$primaryBg"))),
                  ),
                ),
              ),
            Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: StyledText(
                      textAlign: TextAlign.center,
                            text: '<style>Si votre entreprise vous offre ce service et vous permet d’être livré directement sur votre lieu de travail deux fois par mois.<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryText"))),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
