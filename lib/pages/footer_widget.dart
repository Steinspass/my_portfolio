import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_portfolio/extensions/hover_extesions.dart';


class FooterWidget extends StatefulWidget {
  FooterWidget({Key key}) : super(key: key);

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF04042A),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.0,),
          _rowSocialIcons(),
          _textTechUsed(
            'images/flutter-icon.png',
            'Flutter',
            ' Build with 💙 using: \n ',
            'https://flutter.dev/'
          ),
          SizedBox(height: 20.0,),
          _atributionIcons(),
          SizedBox(height: 20.0,),
          _textIconAtributionUsed(
            'Adib Sulthon',
            'https://www.flaticon.com/authors/adib-sulthon',
            'https://www.flaticon.com'
          ),
           SizedBox(height: 20.0,),
          _nameOfCreator(),
          SizedBox(height: 40.0,)
        ],
      ),
    ); 
  }

  Widget _rowSocialIcons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(AntDesign.github), 
            color: Colors.yellowAccent,
            tooltip: "Github",
            hoverColor: Colors.grey[400].withOpacity(0.4), 
            iconSize: context.isMobile ? 15.0 : 25.0,
            onPressed: () => launch("https://github.com/Steinspass"),
          ).showCursorOnHover.moveUpOnHover,
          SizedBox(width: 40.0,),
          IconButton(
            icon: Icon(AntDesign.twitter),
            tooltip: "Twitter",
            color: Colors.yellowAccent,
            hoverColor: Colors.grey[400].withOpacity(0.4), 
            iconSize: context.isMobile ? 15.0 : 25.0,
            onPressed: () => launch("https://twitter.com/SteinsPass11"),
          ).showCursorOnHover.moveUpOnHover,
          SizedBox(width: 40.0,),
          IconButton(
            icon: Icon(MaterialIcons.email), 
            color: Colors.yellowAccent,
            tooltip: "Copy the Email",
            hoverColor: Colors.grey[400].withOpacity(0.4), 
            iconSize: context.isMobile ? 15.0 : 25.0,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: 'naimdridideveloper@gmail.com'));
            },
          ).showCursorOnHover.moveUpOnHover,
        ],
      ),
    );
  }

  Widget _textTechUsed(String iconPath, String name, String desc, String link){

    final textStyle = TextStyle(
            fontSize: 20.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    final textColorStyle = TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blueGrey[500]
          );      

    return Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            desc,
            textAlign: TextAlign.start,
            style: textStyle,
          ),
          Image(
            image: AssetImage(iconPath),
            fit: BoxFit.cover,
            height: 30.0,
            width: 30.0,
            colorBlendMode: BlendMode.darken,  
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launch(link),
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: textColorStyle,
                
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _textIconAtributionUsed(String nameDesigner, String linkProfile, String link){

    final textStyle = TextStyle(
            fontSize: 16.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    final textColorStyle = TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blueGrey[500]
          );
                

    return Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            'Icon made by ',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
           MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launch(linkProfile),
              child: Text(
                nameDesigner,
                textAlign: TextAlign.start,
                style: textColorStyle,
                
              ),
            ),
          ),
          SelectableText(
            ' from ',
            textAlign: TextAlign.start,
            style: textStyle,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launch(link),
              child: Text(
                'FlatIcon',
                textAlign: TextAlign.start,
                style: textColorStyle,
                
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _atributionIcons() {
    final textStyle = TextStyle(
            fontSize: 18.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launch("https://iconos8.es"),
              child: Text(
                'I have used Icon8 icons',
                textAlign: TextAlign.start,
                style: textStyle,
                
              ),
            ),
          );
  }


  Widget _nameOfCreator() {
    final textStyle = TextStyle(
            fontSize: 16.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
           
          );

    return Text(
      '© 2020 Naim Dridi Podadera.',
      textAlign: TextAlign.start,
      style: textStyle,
      
    );
  }

  
}