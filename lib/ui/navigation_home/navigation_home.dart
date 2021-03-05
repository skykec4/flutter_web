import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/home/home.dart';
import 'package:flutter_blog/ui/profile/profile.dart';
import 'package:flutter_blog/ui/utils/constant.dart';

class NavigationHome extends StatefulWidget {
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  int _currentMenu = 0;

  @override
  Widget build(BuildContext context) {
    var witdh = MediaQuery.of(context).size.width;

    if (witdh <= 480) {
      print('MOBILE : $witdh');
    }else if(witdh < 800){
      print('TABLET : $witdh');
    }else{
      print('DESTOP : $witdh');
    }
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: leftText(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            menuIcon(0, Icons.home, "home",witdh),
            SizedBox(
              width: 10,
            ),
            menuIcon(1, Icons.account_circle_rounded, "profile",witdh),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentMenu,
        children: [

          Home(),
          Profile()
        ],
      ),
    );
  }

  Widget leftText() {
    return WavyAnimatedTextKit(
      textAlign: TextAlign.center,
      speed: Duration(milliseconds: 500),
      textStyle: TextStyle(
        // fontSize: 32.0,
          color: Colors.white,
          fontWeight: FontWeight.bold),
      text: [
        "Blog",
      ],
      isRepeatingAnimation: true,
    );
  }

  Widget menuIcon(int menuNum, IconData icon, String menuTitle,double witdh) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentMenu = menuNum;
        });
      },
      child: Container(
        width: 70,
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 1,
            ),
            Icon(
              icon,
              color: _currentMenu == menuNum ? Colors.white : Colors.white54,
              size: witdh <= 480 ? 50 : 30,
            ),
            witdh <= 480 ?SizedBox() : Text(
              menuTitle,
              textScaleFactor: .8,
              style: TextStyle(
                  color:
                  _currentMenu == menuNum ? Colors.white : Colors.white54),
            ),
            _currentMenu == menuNum
                ? Container(height: 3, color: Colors.white)
                : SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
