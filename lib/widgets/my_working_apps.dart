import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_portfolio/extensions/hover_extesions.dart';



class MyWorkingApps extends StatefulWidget {
  MyWorkingApps({Key key}) : super(key: key);

  @override
  _MyWorkingAppsState createState() => _MyWorkingAppsState();
}

class _MyWorkingAppsState extends State<MyWorkingApps> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        _titleOffSection(),
        _buildCard(context),
        SizedBox(height: context.isMobile ? 40.0  : 80.0,),
        _buttonMoreProjects()
      ],
    );

   
  }

  _titleOffSection() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 20.0, bottom: 0.0),
        child: Text(
          'Projects',
          style: TextStyle(
            fontSize: context.isMobile ? 80 : 160,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[800].withOpacity(0.3)
          ),
        ),
      ),
    );
  }

  SizedBox _buildCard(BuildContext context) {
    return SizedBox(
    height: context.isMobile 
    ? MediaQuery.of(context).size.height / 0.9
    : MediaQuery.of(context).size.height / 1.0,
    child: Neumorphic(
      margin: context.isMobile
      ? EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0
      )
      : EdgeInsets.symmetric(
        horizontal: 160.0,
        vertical: 100.0
      ),
      style: NeumorphicStyle(
        shadowDarkColor: Colors.grey[900],
        shadowLightColor: Colors.grey[900],
        shape: NeumorphicShape.concave,
        depth: 20,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(5.0)
        ),
        lightSource: LightSource.bottomLeft,
        color: Color(4279374354).withOpacity(0.4)
      ),
      child: _columnInfoApps(),
    ),
  );
  }

  Widget _columnInfoApps() {
    return Column(
      children: [
        _nameApp(),
        _rowTextDescAndImage(),
        _rowOfButtons()
      ],
    );
  }

  Widget _nameApp() {
     return Align(
       alignment: Alignment.topLeft,
       child: Padding(
         padding: context.isMobile 
         ? EdgeInsets.symmetric(
           horizontal: 15.0,
           vertical: 20.0
         )
         : EdgeInsets.symmetric(
           horizontal: 30.0,
           vertical: 60.0
         ),
         child: SelectableText(
           " BunkaList ",
           toolbarOptions: ToolbarOptions(
             copy: true,
             selectAll: true
           ),  
           enableInteractiveSelection: true,
             style: TextStyle(
               fontSize: context.isMobile ? 30 : 60,
               color: Colors.white,
               letterSpacing: context.isMobile ? -0.5 : -1.5,
               fontWeight: FontWeight.w600,
               shadows: getGlitchShadowText(context),
             ),  
           ).showCursorOnHover.distorsionNameAppOnHover,
       ),
     );
  }



  Widget _rowTextDescAndImage() {
    final row = Row(
      children: [
        Expanded(child: _textInfoAboutApp(), flex: 1,),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
             image: AssetImage('images/bunkalist-cover.png'),
             height: context.isMobile 
              ? MediaQuery.of(context).size.height / 2.0
              : MediaQuery.of(context).size.height / 2.0,
          ),
        ), flex: 1,)
      ],
    );

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _textInfoAboutApp(),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image(
             image: AssetImage('images/bunkalist-cover.png'),
             height: context.isMobile 
              ? MediaQuery.of(context).size.height / 2.0
              : MediaQuery.of(context).size.height / 2.0,
          ),
        )
      ],
    );

    return context.isMobile ? column : row;
  }

  Widget _textInfoAboutApp() {
    String infoAboutApp = '''
    Bunkalist is a manager of the movies, series and anime that you have seen or are watching to have the ordered in lists. It also allows you to find or discover new movies, series and anime to watch.

    This has been my personal project in recent months with which I learned what it is to develop a real app. In which I learned to create design style, to use software design pattern, the process of optimizing the file of a mobile application in an application store (ASO), multilanguage support.
    ''';

    return Padding(
      padding: context.isMobile 
      ? EdgeInsets.all(10.0)
      : EdgeInsets.all(40.0),
      child: SelectableText(
          infoAboutApp,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: context.isMobile ? 14.0 : 24.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),  
        ),
    );
  }

  Widget _rowOfButtons(){

    final buttonsMobile = [
            Expanded(child: _buttonGoAppStore(),),
            SizedBox(width: 10.0,),
            Expanded(child: _buttonGoGithub(),)
          ];
    final buttonsDesktop = [
            _buttonGoAppStore(),
            SizedBox(width: 20.0,),
            _buttonGoGithub()
          ];

    return Align(
      alignment: context.isMobile 
      ? Alignment.center
      : Alignment.bottomLeft,
      child: Padding(
        padding:context.isMobile
        ? EdgeInsets.symmetric(
           horizontal: 5.0,
           vertical: 5.0
         )
        : EdgeInsets.symmetric(
           horizontal: 50.0,
           vertical: 5.0
         ),
        child: Row(
          children: context.isMobile ? buttonsMobile : buttonsDesktop
        ),
      ),
    );
  }

  Widget _buttonGoAppStore() {
    return RaisedButton(
      onPressed: () => launch('https://play.google.com/store/apps/details?id=com.bunkalogic.bunkalist'),

      color: Colors.deepPurpleAccent,
      elevation: 2.0,
      hoverColor: Colors.deepPurpleAccent[400],
      hoverElevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: _rowTextAndIcon(),
      textTheme: ButtonTextTheme.primary,
    );
  }

  Widget _rowTextAndIcon() {
    final buttonMobile = Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Icon(Entypo.google_play, 
            color: Colors.white,
            size: context.isMobile ? 20.0 : 35.0,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Play Store',
              style: TextStyle(
                fontSize: context.isMobile? 16.0 : 24.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
              ),
            ),
          ),
          
          
        ],
      ),
    );

    final buttonDesktop = Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Entypo.google_play, 
          color: Colors.white,
          size: context.isMobile ? 20.0 : 35.0,
          ),
          SizedBox(width: 20.0,),
          Text(
            'Play Store',
            style: TextStyle(
              fontSize: context.isMobile? 16.0 : 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            ),
          ),
          
          
        ],
      ),
    );

    return context.isMobile ? buttonMobile : buttonDesktop;
  }

  Widget _buttonGoGithub() {
    return OutlineButton(
      onPressed: () => launch('https://github.com/bunkalogic/BunkaList-Flutter-Version'),
      hoverColor: Colors.deepPurpleAccent[400],
      borderSide: BorderSide(
        color: Colors.deepPurpleAccent[400],
        width: 4.0
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: _rowTextAndIconGithub(),
      textTheme: ButtonTextTheme.primary,
    );
  }

  Widget _rowTextAndIconGithub() {

    final buttonMobile = Container(
      margin: EdgeInsets.all(6.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Icon(AntDesign.github, 
            color: Colors.white,
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
                color: Colors.white,
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
          color: Colors.white,
          size: context.isMobile ? 20.0 : 40.0,
          ),
          SizedBox(width: 20.0,),
          Text(
            'View Project',
            style: TextStyle(
              fontSize: context.isMobile? 16.0 : 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            ),
          ),
        ],
      ),
    );

    return context.isMobile ? buttonMobile : buttonDesktop;

  }

  Widget _buttonMoreProjects(){

    return Container(
      width: context.isMobile
      ? MediaQuery.of(context).size.width / 1.80
      : MediaQuery.of(context).size.width / 2.80,
      child: new Neumorphic(
              margin: context.isMobile
              ? EdgeInsets.symmetric(
                horizontal: 1.0,
                vertical: 1.0
              )
              : EdgeInsets.symmetric(
                horizontal: 100.0,
                vertical: 20.0
              ),
              style: NeumorphicStyle(
                shadowDarkColor: Colors.yellowAccent,
                shadowLightColor: Colors.yellowAccent,
                shape: NeumorphicShape.convex,
                depth: 20,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(5.0)
                ),
                lightSource: LightSource.bottomLeft,
                color: Colors.yellowAccent
              ),
              child: GestureDetector(
                onTap: () async {
                  launch("https://github.com/Steinspass");
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: context.isMobile 
                    ? EdgeInsets.all(5.0)
                    : EdgeInsets.all(15.0),
                    child: Text(
                      "More Projects in my Github Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:context.isMobile ? 20.0 : 30.0,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }  
}