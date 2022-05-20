import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/background_slide.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    Widget background = Container(
      decoration: BoxDecoration(
        
        image: DecorationImage(
          image: AssetImage(slideList[index].imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          decoration:
          BoxDecoration(color: Colors.black26.withOpacity(0.3)),
        ),
      ),
    );
    Widget description = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        slideList[index].title,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
    return Stack(

        children: <Widget>[
          background,
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 20, top: 600),

            child: description,
          )
        ]
    );
  }
}
