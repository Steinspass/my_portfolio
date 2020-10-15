import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/widgets/title_section_widget.dart';
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
         TitleSectionWidget(title: 'Services',),
         _containerItemServices()
       ],
    );
  }


  Widget _containerItemServices(){
    final rowItem = Container(
      width: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 30.0,
        isTablet: MediaQuery.of(context).size.width - 50.0,
        isDesktop: MediaQuery.of(context).size.width - 350.0, 
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
    

    final columnItem = Container(
      width: MediaQuery.of(context).size.width - 20.0,
      child: Column(
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
      )
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
          fontSize:returnForTypeSize(
            isMobile: 18.0,
            isTablet: 22.0,
            isDesktop: 28.0
          ), 
          fontWeight: FontWeight.w500,
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
      fontSize: returnForTypeSize(
        isMobile: 16.0,
        isTablet: 20.0,
        isDesktop: 24.0
      ), 
      color: Colors.grey[400],
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.josefinSansTextTheme().headline6.fontFamily,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 10.0
      ),
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: subtitle,
                  style: textStyle, 
                )
              ]
            ),          
          ),
      ),
    );
  }


}