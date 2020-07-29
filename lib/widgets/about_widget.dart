import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';


class AboutMeWidget extends StatefulWidget {
  AboutMeWidget({Key key}) : super(key: key);

  @override
  _AboutMeWidgetState createState() => _AboutMeWidgetState();
}

class _AboutMeWidgetState extends State<AboutMeWidget> {
 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titleOffSection(),
        _columnIntroAbout(),
        
      ],
    );
  }

  _titleOffSection() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          'About me',
          style: TextStyle(
            fontSize: context.isMobile ? 80 : 160,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800].withOpacity(0.3)
          ),
        ),
      ),
    );
  }


  Widget _columnIntroAbout(){
    return Container(
      margin: context.isMobile
      ? EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40.0
      )
      : EdgeInsets.symmetric(
        horizontal: 300.0,
        vertical: 40.0
      ),
      child: Column(
        children: [
          _titleIntro("Introduction"),
          SizedBox(height: 40.0,),
          _textIntro(),
          _titleIntro("Most recently used technologies"),
          SizedBox(height: 40.0,),
          _textTechUsed(
            'images/flutter-icon.png',
            'Flutter',
            ' - Framework for development applications for mobile, web, and desktop.',
            'https://flutter.dev/'
          ),
          _textTechUsed(
            'images/firebase-icon.png',
            'Firebase',
            ' - Is a set of tools aimed at creating high-quality applications.                ',
            'https://firebase.google.com'
          ),
        ],
      ),
    );
  }

  Widget _titleIntro(String title) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[100],
          fontSize: context.isMobile ? 20.0 : 35.0,
          fontWeight: FontWeight.w800,
          letterSpacing: 2.0,
          shadows: getGlitchShadowText(context)
        ),
        ),
    );
  }

  Widget _textIntro(){
    String infoAboutApp = 
    """
    Hey, I'm Naim Dridi Podadera 👋

    I am a self-taught software developer focused primarily on building a beautiful cross-platform mobile app using Flutter. I like to learn new technologies and best practices every day. I can quickly learn new tools and technologies when necessary. I am always motivated by a challenge and I like to be well organized to deliver consistent results.

    I am now looking to hire freelance opportunities. In which to help businesses gain an online presence and improve your productivity with mobile applications in both the Play Store and Apple Store. You can get in touch with me today.



    When I work focused on these things:

      🎨 In designing good interfaces that look great.
      🔮 Make them intuitive and easy to use with a good user experience.
      📱  Developing multiplatform mobile apps with same expirences. 



    Things i keep in mind:

      ♻  Reusability
      ⏱ Efficiency
      📚 Patterns Designs
      🎯 Consistency
      🤖 Automation
    """;

     final textStyle = TextStyle(
            fontSize: context.isMobile ? 14.0 : 26.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    return Align(
      alignment: Alignment.topCenter,
      child: RichText(
        textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: infoAboutApp,
                style: textStyle, 
              )
            ]
          ),          
        ),
    );
  }

  Widget _textTechUsed(String iconPath, String name, String desc, String link){

    final textStyle = TextStyle(
            fontSize: context.isMobile ? 16.0 : 26.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    final textColorStyle = TextStyle(
            fontSize: context.isMobile ? 16.0 : 26.0,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blueGrey[500]
          );

    return Center(
      child: Container(
        margin: EdgeInsets.all(2.0),
        child: ListTile(
          leading: Image(
                image: AssetImage(iconPath),
                fit: BoxFit.cover,
                height: context.isMobile ? 20.0 : 30.0,
                width: context.isMobile ? 20.0 : 30.0,  
              ),
          title: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launch(link),
                  child: Text(
                    name,
                    style: textColorStyle,
                    
                  ),
                ),
              ),
          subtitle: SelectableText(
                desc,
                style: textStyle,
              ),        
        ),
      ),
    );            

    
  }
  
}