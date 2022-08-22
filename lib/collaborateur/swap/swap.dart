import 'package:flutter/material.dart';

import 'package:recolt_app/assets/colors/design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class Swap extends StatefulWidget {
  const Swap({Key? key}) : super(key: key);

  @override
  SwapState createState() => SwapState();
}

class SwapState extends State<Swap> {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                            child: StyledText(
                            text: '<style>PASSAGE à RECOLT<style>',
                            tags: {'style': StyledTextTag(style: const TextStyle(fontSize: 30))},
                            style: GoogleFonts.raleway(color: Color(int.parse("0xff$secondaryCta"))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]
              )
            
          )
        )
      
    );
  }
}