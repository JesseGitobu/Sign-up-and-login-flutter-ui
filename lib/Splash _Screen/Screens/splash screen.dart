import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/background_slide_dots.dart';
import '../model/background_slide.dart';
import '../widgets/slide_background.dart';
import 'package:signup_ui_backend/log_in/login_screen.dart';
import 'package:signup_ui_backend/sign_up/signup_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
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
    Widget helloWidget = Text(
      'Hello,',
      style: TextStyle(
          color: Colors.white,
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
      padding: const EdgeInsets.only(right: 56.0),
      child: RichText(
        text: TextSpan(

          children: [
            TextSpan(text: 'Welcome to ', style: TextStyle(color: Colors.white, fontSize:25),),
            TextSpan(
              text: 'XYZ',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize:30),
            ),
            TextSpan(
              text: 'MART',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue, fontSize:30 ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[

              Stack(
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
                        margin: const EdgeInsets.only(bottom: 180),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < slideList.length; i++)
                              if (i == _currentPage)
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

            Padding(
              padding: const EdgeInsets.only(
                left: 28.0,
                right: 20,
                // top: 700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1),
                  helloWidget,
                  Padding(padding: const EdgeInsets.only(top: 20),

                  child: subTitle,
                  ),
                  Spacer(flex: 4,),
                  Center(child: OutlinedButton(

                    child: Text(
                      'Getting Started',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                      side: BorderSide(color: Colors.blue, width: 1), //<-- SEE HERE
                    ),


                    onPressed: () {
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
                    },
                  ),),
                  Padding(padding: const EdgeInsets.only(bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              LoginScreen.routeName);
                        },
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



