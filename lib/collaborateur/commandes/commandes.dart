import 'package:flutter/material.dart';
import 'dart:async';
import 'package:recolt_app/assets/colors/design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/services.dart';
import 'package:recolt_app/collaborateur/profil/profil.dart';
import 'package:recolt_app/collaborateur/swap/swap.dart';
import 'package:recolt_app/collaborateur/decouvrir/accueil.dart';

import '../../widgets/slide_item.dart';
import '../../model/slide.dart';
import '../../widgets/slide_dots.dart';


class Commandes extends StatefulWidget {
  const Commandes({Key? key}) : super(key: key);

  @override
  CommandesState createState() => CommandesState();
}

class CommandesState extends State<Commandes> 
with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Widget> route = [const Accueil(), const Commandes(), const Profil(), const Swap()];
    int currentIndex = 1;
    final autoSizeGroup = AutoSizeGroup();
     //default index of a first screen

    late AnimationController _animationController;
    late Animation<double> animation;
    late CurvedAnimation curve;
    bool pressAttention = false;
    final iconList = <IconData>[
      Icons.visibility, 
      Icons.library_books,
      Icons.person_outline,
      Icons.swap_horiz,
    ];
    final List<String> entries = <String>[
      'Découvrir',
      'Commandes',
      'Profil',
      'Swap'
    ];

    final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    super.initState();
    
    Timer.periodic(const Duration(days: 7), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  
    

    
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: _customColorScheme,
      ),
      child: Scaffold(  
          
      key: scaffoldKey,    
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Color(int.parse("0xff$primaryBg")),
      body:
      Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 95),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for(int i = 0; i<slideList.length; i++)
                                if( i == _currentPage )
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
                            
            ],
          ),
        
      
      
      
        floatingActionButton: ScaleTransition(
            scale: animation,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Color(int.parse("0xff$primaryCta")),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset('images/picto_recolt.png',
                ),
              ),
              onPressed: () {
                _animationController.reset();
                _animationController.forward();
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? HexColor('#374561') : HexColor('#7686A5');
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      entries[index],
                      textScaleFactor: 0.85,
                      maxLines: 1,
                      style: TextStyle(color: color),
                      group: autoSizeGroup,
                    ),
                  )
                ],
              );
            },
          backgroundColor: HexColor('#EFDFC5'),
          activeIndex: currentIndex,
          splashColor: HexColor('#FFA400'),
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap:  (index) => Navigator.push(context, MaterialPageRoute(builder: (context) => route[index])),
        )
      ) 
    );                
       
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  const NavigationScreen(this.iconData, {Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularRevealAnimation(
          animation: animation,
          centerOffset: const Offset(80, 80),
          maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
          child: Icon(
            widget.iconData,
            color: HexColor('#FFA400'),
            size: 160,
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
const Color customBG = Color(0x00fff7ea);
const Color customMagenta100 = Color(0xfffaac9d);
const Color customMagenta300 = Color(0xfff8836c);
const Color customMagenta400 = Color(0xfff65a3b);

const Color customMagenta900 = Color(0xfff4310a);
const Color customMagenta600 = Color(0xffc32708);

const Color customErrorRed = Color(0xFFC5032B);

const Color customSurfaceWhite = Color(0xFFFFFBFA);
const Color customBackgroundWhite = Colors.white;

ColorScheme _customColorScheme = const ColorScheme(
  primary: customBG,
  secondary: Colors.amber,
  surface: Colors.purpleAccent,
  background: customSurfaceWhite,
  error: customMagenta900,
  onPrimary: Colors.red,
  onSecondary: Colors.deepOrange,
  onSurface: customMagenta300,
  onBackground: customMagenta100,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);