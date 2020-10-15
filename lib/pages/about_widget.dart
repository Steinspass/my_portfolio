import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/widgets/title_section_widget.dart';
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
        TitleSectionWidget(title: 'About me',),
        _columnIntroAbout(),
        
      ],
    );
  }



  Widget _columnIntroAbout(){
    return Container(
      margin: returnForTypeSize(
        isMobile: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0
        ),
        isTablet: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 40.0
        ),
        isDesktop: const EdgeInsets.symmetric(
          horizontal: 160.0,
          vertical: 100.0
        ),
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
          fontSize: returnForTypeSize(isMobile: 20, isTablet: 24, isDesktop: 34),
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
            fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26),
            color: Colors.grey[400],
            fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    return Container(
      width: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 30.0,
        isTablet: MediaQuery.of(context).size.width - 50.0,
        isDesktop: MediaQuery.of(context).size.width - 350.0, 
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: RichText(
          textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: infoAboutApp,
                  style: textStyle, 
                )
              ]
            ),          
          ),
      ),
    );
  }

  Widget _textTechUsed(String iconPath, String name, String desc, String link){

    final textStyle = TextStyle(
            fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26),
            color: Colors.grey[400],
            fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily
          );

    final textColorStyle = TextStyle(
            fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26),
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