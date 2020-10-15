import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/widgets/btn_outline_github.dart';
import 'package:my_portfolio/widgets/button_neon_widget.dart';
import 'package:my_portfolio/widgets/container_shadow_widget.dart';
import 'package:my_portfolio/widgets/title_section_widget.dart';
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
        TitleSectionWidget(title: 'Projects',),
        _buildContainer(),
        _gridMoreProjects(),
        SizedBox(height: context.isMobile ? 40.0  : 80.0,),
        _buttonNeonMoreProjects()
      ],
    );

   
  }


  Widget _buildContainer(){
    return ContainerNeonWidget(
      widthSize: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 30.0,
        isTablet: MediaQuery.of(context).size.width - 120.0,
        isDesktop: MediaQuery.of(context).size.width - 350.0, 
      ),
      heightSize: returnForTypeSize(
        isMobile:  MediaQuery.of(context).size.height / 0.95,
        isTablet:  MediaQuery.of(context).size.height / 1.4,
        isDesktop: MediaQuery.of(context).size.height / 1.2,
      ),
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
      padding: EdgeInsets.all(8.0),     
      child: _columnInfoApps()
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
         padding: returnForTypeSize(
        isMobile: const EdgeInsets.symmetric(
           horizontal: 15.0,
           vertical: 20.0
         ),
        isTablet: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0
        ),
        isDesktop: const EdgeInsets.symmetric(
           horizontal: 30.0,
           vertical: 60.0
         ), 
      ),
         child: SelectableText(
           " BunkaList ",
           toolbarOptions: ToolbarOptions(
             copy: true,
             selectAll: true
           ),  
           enableInteractiveSelection: true,
             style: TextStyle(
               fontSize: returnForTypeSize(
                 isMobile: 30.0,
                 isTablet: 40.0,
                 isDesktop: 60.0
               ), 
               color: Colors.white,
               letterSpacing: context.isMobile ? -0.5 : -1.5,
               fontWeight: FontWeight.w600,
               shadows: getGlitchShadowText(context),
               fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
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
             image: AssetImage('images/screens_bunkalist.png'),
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
             image: AssetImage('images/screens_bunkalist.png'),
             height: context.isMobile 
              ? MediaQuery.of(context).size.height / 2.2
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
      padding: returnForTypeSize(
        isMobile: EdgeInsets.all(10.0),
        isTablet: EdgeInsets.all(20.0),
        isDesktop: EdgeInsets.all(40.0),
      ),
      child: SelectableText(
          infoAboutApp,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: returnForTypeSize(
              isMobile: 16.0,
              isTablet: 20.0,
              isDesktop: 24.0
            ), 
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
            Expanded(child: BtnOutlineGithub(url: 'https://github.com/bunkalogic/BunkaList-Flutter-Version'),)
          ];
    final buttonsDesktop = [
            _buttonGoAppStore(),
            SizedBox(width: 20.0,),
            BtnOutlineGithub(url: 'https://github.com/bunkalogic/BunkaList-Flutter-Version')
          ];

    return Align(
      alignment: context.isMobile 
      ? Alignment.center
      : Alignment.bottomLeft,
      child: Padding(
        padding:returnForTypeSize(
          isMobile:  const EdgeInsets.symmetric(
           horizontal: 5.0,
           vertical: 5.0
         ),
          isTablet:  const  EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0
          ),
          isDesktop: const  EdgeInsets.symmetric(
           horizontal: 50.0,
           vertical: 5.0
         ),
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
      color: Color(0xFFF9FF05).withOpacity(0.85),
      elevation: 2.0,
      hoverColor: Color(0xFFF9FF05),
      hoverElevation: 10.0,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(5.0),
      // ),
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
            color: Colors.black,
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
                color: Colors.black,
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
          color: Colors.black,
          size: context.isMobile ? 20.0 : 35.0,
          ),
          SizedBox(width: 20.0,),
          Text(
            'Play Store',
            style: TextStyle(
              fontSize: context.isMobile? 16.0 : 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
            ),
          ),
          
          
        ],
      ),
    );

    return context.isMobile ? buttonMobile : buttonDesktop;
  }

 

  Widget _buttonNeonMoreProjects(){
    return ButtonNeonWidget(
      buttonColor: Color(0xFFF9FF05),
      shadowColor: Color(0xFFF9FF05).withOpacity(0.5),
      title: 'More Projects in my Github Profile',
      onTap: () async {
        await launch("https://github.com/Steinspass");
      },
      padding: EdgeInsets.all(4.0),
      titleStyle: TextStyle(
        color: Color(0xFF1E1B1B),
        fontSize:context.isMobile ? 18.0 : 28.0,
        fontWeight: FontWeight.w600,            
      ),
      marginTitle: context.isMobile 
        ? const EdgeInsets.all(5.0)
        : const EdgeInsets.all(15.0),
      widthSize: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width / 1.60,
        isTablet: MediaQuery.of(context).size.width / 1.80,
        isDesktop: MediaQuery.of(context).size.width / 2.80,
      ),
      margin: returnForTypeSize(
        isMobile: const EdgeInsets.symmetric(
          horizontal: 1.0,
          vertical: 1.0
        ),
        isTablet: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0
        ),
        isDesktop: const EdgeInsets.symmetric(
          horizontal: 100.0,
          vertical: 20.0
          ),
      ),
    );
  }

  Widget _gridMoreProjects(){
    return Wrap(
      direction: context.isMobile ? Axis.vertical : Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _miniContainerProjects(
          title: 'Sketch Generator App',
          subtitle: 'App where you can draw a sketch and calling an API with a neural network is capable of returning a realistic image based on the drawn sketch.',
          url: 'https://github.com/Steinspass/sketch_generator_shoes_app',
        ),
        _miniContainerProjects(
          title: 'Flask Neuronal Network API',
          subtitle: 'API created with Python using Flask, which using a neural network model based on the pix2pix model is capable of returning a realistic image from a sketch.',
          url: 'https://github.com/Steinspass/flask_neural_network_api',
        ),
        _miniContainerProjects(
          title: 'Image to Text App',
          subtitle: 'App that from an image using a natural language processing algorithm is able to return a description of what the image contains.',
          url: 'https://github.com/Steinspass/image_to_text_generator_app',
        ),
        _miniContainerProjects(
          title: 'Text Sentiment Analysis App',
          subtitle: 'App that from the text using a natural language processing algorithm is able to identify the feelings that are expressed within the text.',
          url: 'https://github.com/Steinspass/sentiment_analysis_app',
        ),
      ],
    );
  }

  Widget _miniContainerProjects({String title, String subtitle, String url}){
    return ContainerNeonWidget(
      widthSize:
      returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 40,
        isTablet: MediaQuery.of(context).size.width * 0.35,
        isDesktop: MediaQuery.of(context).size.width * 0.40,
      ), 
      padding: context.isMobile ? EdgeInsets.all(6.0)  : EdgeInsets.all(12.0), 
      margin: returnForTypeSize(
        isMobile: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0
        ),
        isTablet: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0
        ),
        isDesktop: const EdgeInsets.symmetric(
          horizontal: 60.0,
          vertical: 40.0
          ),
      ), 
      child: Column(
        children: [
          _titleOfProjects(title),
          _subtitleOfProjects(subtitle),
          BtnOutlineGithub(url: url)
        ],
      )
    );
  }

  Widget _titleOfProjects(String title) {
    return Align(
      alignment: Alignment.center,
      child: SelectableText(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: context.isMobile ? 18 : 24.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          shadows: getGlitchShadowText(context),
          letterSpacing: 4.0,
          // decoration: TextDecoration.underline,
          // decorationColor: color
        ),
      ),
    );
  }

  Widget _subtitleOfProjects(String subtitle){
    return Padding(
      padding: context.isMobile 
      ? EdgeInsets.all(10.0)
      : EdgeInsets.all(40.0),
      child: SelectableText(
          subtitle,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: context.isMobile ? 16.0 : 22.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),  
        ),
    );
  } 
}