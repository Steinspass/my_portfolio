import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';



class BtnOutlineGithub extends StatefulWidget {
  final String url;
  BtnOutlineGithub({@required this.url});

  @override
  _BtnOutlineGithubState createState() => _BtnOutlineGithubState();
}

class _BtnOutlineGithubState extends State<BtnOutlineGithub> {

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: OutlineButton(
        onPressed: () => launch('${widget.url}'),
        hoverColor: Color(0xFFF9FF05),
        borderSide: BorderSide(
          color: Color(0xFFF9FF05),
          width: 4.0
        ),
        child: _rowTextAndIconGithub(),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  Widget _rowTextAndIconGithub() {

    final buttonMobile = Container(
      padding: const EdgeInsets.symmetric(
           horizontal: 4.0,
           vertical: 4.0
         ),
      margin: const EdgeInsets.symmetric(
           horizontal: 15.0,
           vertical: 5.0
         ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Icon(AntDesign.github, 
            color: _hovering ? Colors.black : Colors.white,
            size: context.isMobile ? 20.0 : 40.0,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'View Project',
              style: TextStyle(
                fontSize: context.isMobile? 16.0 : 24.0,
                fontWeight: FontWeight.w400,
                color: _hovering ? Colors.black : Colors.white,
                fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );

    final buttonDesktop = Container(
      margin: EdgeInsets.all(6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(AntDesign.github, 
          color: _hovering ? Colors.black : Colors.white,
          size: context.isMobile ? 20.0 : 40.0,
          ),
          SizedBox(width: 20.0,),
          Text(
            'View Project',
            style: TextStyle(
              fontSize: context.isMobile? 16.0 : 24.0,
              fontWeight: FontWeight.w400,
              color: _hovering ? Colors.black : Colors.white,
              fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            ),
          ),
        ],
      ),
    );

    return context.isMobile ? buttonMobile : buttonDesktop;

  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  } 
}