import 'package:flutter/material.dart';

import 'package:recolt_app/assets/colors/design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class Collaborateur extends StatefulWidget {
  const Collaborateur({Key? key}) : super(key: key);

  @override
  CollaborateurState createState() => CollaborateurState();
}

class CollaborateurState extends State<Collaborateur> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      backgroundColor: Color(int.parse("0xff$primaryText")),
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
                            child: Text(
                            'Inscrivez-vous pour vous lancer dans l\'aventure recolt',
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$primaryBg"))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                ],
                
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Accueil');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    primary: Color(int.parse("0xff$primaryBg")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: StyledText(
                    text: '<style>inscription<style>',
                    tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal))},
                    style: GoogleFonts.katibeh(color: Color(int.parse("0xff$primaryText"))),
                  ),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}