import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:velocity_x/velocity_x.dart';


class ServicesWidget extends StatefulWidget {
  ServicesWidget({Key key}) : super(key: key);

  @override
  _ServicesWidgetState createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         _titleOffSection(),
         _containerItemServices()
       ],
    );
  }

  _titleOffSection() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          'Services',
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

  Widget _containerItemServices(){
    final rowItem = Row(
      children: [
        _itemOfServices(
          ' UI/UX Design ',
          'images/web-design.png',
          'Good looking user interfaces with a good user experience with Colors, components, typography etc... '
        ),
        _itemOfServices(
          ' Software Design Patterns ',
          'images/coding.png',
          'The use of the test-based development pattern (TDD) allows the scalability and continuous improvement of the tests to achieve a good performance and operation of the apps.'
        ),
        _itemOfServices(
          ' App Store Optimization ',
          'images/infographic.png',
          'Your raking on App Stores will improve and growth hacking strategies will be tested and reported to keep you ahead of your competitors. '
        )
      ],
    );

    final columnItem = Column(
      children: [
        _itemOfServices(
          ' UI/UX Design ',
          'images/web-design.png',
          'Good looking user interfaces with a good user experience with Colors, components, typography etc... '
        ),
         SizedBox(height: 40.0,),
        _itemOfServices(
          ' Software Design Patterns ',
          'images/coding.png',
          'The use of the test-based development pattern (TDD) allows the scalability and continuous improvement of the tests to achieve a good performance and operation of the apps.'
        ),
         SizedBox(height: 40.0,),
        _itemOfServices(
          ' App Store Optimization ',
          'images/infographic.png',
          'Your raking on App Stores will improve and growth hacking strategies will be tested and reported to keep you ahead of your competitors. '
        )
      ],
    );

    return context.isMobile ? columnItem : rowItem;
  }

  Widget _itemOfServices(String title, String imagePath, String subtitle){
    final isDesktop = Expanded(
      child: Column(
        children: [
          imageItemService(imagePath),
          SizedBox(height: 40.0,),
          titleItemService(title),
          SizedBox(height: 10.0,),
          subtitleItemService(subtitle),
          SizedBox(height: 100.0,),
        ],
      ),
    );

    final isMobile = Column(
      children: [
        imageItemService(imagePath),
        SizedBox(height: 20.0,),
        titleItemService(title),
        SizedBox(height: 5.0,),
        subtitleItemService(subtitle)
      ],
    );

    return context.isMobile ? isMobile : isDesktop;
  }

  Widget titleItemService(String title) {
     return Align(
      alignment: Alignment.center,
      child: SelectableText(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: context.isMobile ? 22.0 : 32.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          shadows: getGlitchShadowText(context),
          letterSpacing: 4.0,
        ),
      ),
    );
  }

  Widget imageItemService(String imagePath) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          height: context.isMobile ? 50.0 : 100.0,
          width: context.isMobile ? 50.0 : 100.0,  
        ),
      ),
    );
  }

  Widget subtitleItemService(String subtitle) {
    final textStyle = TextStyle(
      fontSize: context.isMobile ? 14.0 : 24.0,
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
                text: subtitle,
                style: textStyle, 
              )
            ]
          ),          
        ),
    );
  }


}