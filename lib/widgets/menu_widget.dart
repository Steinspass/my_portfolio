import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_portfolio/extensions/hover_extesions.dart';


class MenuWidget extends StatefulWidget {

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.95),
      floatingActionButton: _fabMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textMenuItem(' Home ', 0),
            _textMenuItem(' Projects ', 1),
            _textMenuItem(' Services ', 2),
            _textMenuItem(' Skills ', 3),
            _textMenuItem(' About me ', 4),
            _textMenuItem(' Contact me ', 5),
            SizedBox(height: 60.0,)
          ],
        ),
      ),
    );
  }

  Widget _fabMenu(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: FloatingActionButton(
        heroTag: 'Menu',
        mini: context.isMobile ? true : false,
        hoverColor: Colors.yellowAccent,
        hoverElevation: 15.0,
        backgroundColor: Colors.yellowAccent,
        elevation: 1.0,
        tooltip: "Close Menu",
        child: Icon(
          Icons.close,
          color: Colors.blueGrey[900],
          size: context.isMobile ? 20.0 : 40.0,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _textMenuItem(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context, index);
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.isMobile ? 35 : 70,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w200,
            letterSpacing: 4.0,
            shadows: getGlitchShadowText(context)
          ),  
        ),
      ),
    ).showCursorOnHover.moveUpOnHover;
  }
}