import 'package:flutter/material.dart';
import 'package:recolt_app/assets/colors/design.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: <Widget>[
        const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 22,
            color: Color(int.parse("0xff$primaryCta")),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}