import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/pages/about_widget.dart';
import 'package:my_portfolio/pages/contact_widget.dart';
import 'package:my_portfolio/pages/footer_widget.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/widgets/button_neon_widget.dart';
import 'package:my_portfolio/widgets/menu_widget.dart';
import 'package:my_portfolio/pages/my_working_apps.dart';
import 'package:my_portfolio/pages/services_widget.dart';
import 'package:my_portfolio/pages/skill_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_portfolio/extensions/hover_extesions.dart';



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {

  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  @override
  void initState() { 
     _autoScrollController = AutoScrollController();
    super.initState();
    
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _headerAppBar(),
      body: Material(
        color: Color(0xFF000019),
        child: Scrollbar(
          controller: _autoScrollController,
          child: SingleChildScrollView(
            controller: _autoScrollController,
              child: VStack([
                _wrapScrollTag(
                  index: 0,
                  child: _buildHomePage()
                ),
                _wrapScrollTag(
                  index: 1,
                  child: MyWorkingApps()
                ),
                _wrapScrollTag(
                  index: 2,
                  child: ServicesWidget()
                ),
                _wrapScrollTag(
                  index: 3,
                  child: MySkillWidget()
                ),
                _wrapScrollTag(
                  index: 4,
                  child: AboutMeWidget()
                ),
                _wrapScrollTag(
                  index: 5,
                  child: ContactMeWidget()
                ),
                FooterWidget()
              ]).scrollVertical(),
            ),
        )
      ),
    );
  }

  Widget _headerAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150.0),
      child: _rowHeader(),
    );
  }

  Widget _rowHeader(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         _titleName(),
          _fabMenu()
        ],
      ),
    );
  }

  Widget _titleName() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 2.0
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){
              _scrollToIndex(0);
            },
          child: Text(
            " naimdev.tech ",
              style: TextStyle(
                fontSize: returnForTypeSize(
                  isMobile: 18.0,
                  isTablet: 22.0,
                  isDesktop: 24.0
                ),
                color: Color(0xFFF9FF05),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
                shadows: [
                  Shadow(
                    color: Colors.greenAccent[400],
                    blurRadius: 1.0,
                    offset: Offset(1.5, 1.2),
                  ),
                  Shadow(
                    color: Colors.blueAccent[400],
                    blurRadius: 1.0,
                    offset: Offset(-1.5, 1.2),
                  ),
                  Shadow(
                    color: Colors.redAccent[400],
                    blurRadius: 1.0,
                    offset: Offset(1.5, -1.2),
                  ),
                ]
              ),  
            ),
        ),
      ),
    );
  }

  Widget _fabMenu(){
    return FloatingActionButton(
      heroTag: 'Menu',
      hoverColor: Color(0xFFF9FF05),
      mini: context.isMobile ? true : false,
      hoverElevation: 15.0,
      backgroundColor: Color(0xFFF9FF05).withOpacity(0.8), 
      elevation: 1.0,
      tooltip: "Open Menu",
      child: Icon(
        Icons.menu,
        color: Color(0xFF01011F),
        size: context.isMobile ? 20.0 : 40.0,
      ),
      onPressed: () async
      {

        int indexSelected = await Navigator.of(context).push(PageRouteBuilder<int>(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => MenuWidget(),
        ));

         setState(() {});
        
        _scrollToIndex(indexSelected);
      },
    );
  }

  //! Home Page 


  Widget _buildHomePage(){
    return SafeArea(
        child: Align(
          alignment: Alignment.center,
          child:Container(
            height: context.isMobile 
            ? MediaQuery.of(context).size.height / 1.2 
            : MediaQuery.of(context).size.height / 1.0,
            width: MediaQuery.of(context).size.width,
            child: _columnMiddle()
            // ? _columnMiddle()
            // : AnimatedBackground(
            //   behaviour: MyRacingLinesBehaviour(
            //     direction: LineDirection.Ttb,
            //     numLines:  150
            //   ),
            //   vsync: this,
            //   child: _columnMiddle(),
            // ),
          )
      )
    );
  }

    Widget _columnMiddle(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(flex: 1,),
        _titleOffSection(),
        SizedBox(height: 10.0,),
        _titleMyName(),
        SizedBox(height: 20.0,),
        _subtitleDev(),
        SizedBox(height: 40.0,),
        // _buttonContactMe(),
        // _containerContactMe(),
        _buttonNeonContactMe(),
        Spacer(flex: 3,),
        // _iconArrowDown(),
      ],
    );
  }

 

  // Widget _titleMyName() {
  //   return Center(
  //     child: SelectableText(
  //       " Naim Dridi Podadera ",
  //       toolbarOptions: ToolbarOptions(
  //         copy: true,
  //         selectAll: true
  //       ),  
  //       enableInteractiveSelection: true,
  //         style: TextStyle(
  //           fontSize: context.isMobile ? 36 : 100,
  //           color: Colors.white,
  //           letterSpacing: context.isMobile ? -0.5 : -1.5,
  //           fontWeight: FontWeight.w700,
  //           shadows: getGlitchShadowText(context)
  //         ),  
  //       ),
  //   ).showCursorOnHover.distorsionTitleOnHover;
  // }

  Widget _titleMyName() {
    return Center(
      child: SelectableText(
        " Naim Dridi Podadera ",
        toolbarOptions: ToolbarOptions(
          copy: true,
          selectAll: true
        ),  
        enableInteractiveSelection: true,
          style: TextStyle(
            fontSize: returnForTypeSize(
              isMobile: 35.0,
              isTablet: 75.0,
              isDesktop: 90.0
            ),
            color: Colors.white,
            letterSpacing: context.isMobile ? -0.5 : -1.5,
            fontWeight: FontWeight.w400,
            shadows: getGlitchShadowText(context)
          ),  
        ),
    ).showCursorOnHover.distorsionTitleOnHover;
  }

  Widget _subtitleDev() {

    // Freelancer Multiplaform Mobile App Developer.

    return SizedBox(
      width: 1000.0,
      child: SelectableText(
        " I create beautiful Mobile Apps with modern tech your users love ",
        style: TextStyle(
            fontSize: context.isMobile ? 20 : 40,
            letterSpacing:context.isMobile ? 1.5 : 3.0,
            color: Color(0xFFF9FF05),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            shadows: getGlitchShadowText(context)
        ), 
        textAlign: TextAlign.center, 
      ),
    );
  }

  // Widget _subtitleAnimatedDev() {


  //   return SizedBox(
  //     width: 1500.0,
  //     child: FadeAnimatedTextKit(
  //       text: [
  //         " Freelancer App Mobile Developer",
  //         " Self-taught Software Developer ",
  //         " I create interactive experiences with modern tech.",
          
  //       ],
  //       textStyle: TextStyle(
  //           fontSize: context.isMobile ? 25 : 55,
  //           letterSpacing:context.isMobile ? 1.5 : 3.0,
  //           color: Colors.yellowAccent,
  //           fontStyle: FontStyle.italic,
  //           fontWeight: FontWeight.w300,
  //           shadows: getGlitchShadowText(context)
  //       ), 
  //       textAlign: TextAlign.center,
  //       alignment: AlignmentDirectional.centerStart,
  //       repeatForever: true,
  //       pause: Duration(milliseconds: 1000),
  //       duration: Duration(milliseconds: 1000),   
  //     ),
  //   );
  // }


  Widget _buttonNeonContactMe(){
    return ButtonNeonWidget(
      buttonColor: Color(0xFFF9FF05),
      shadowColor: Color(0xFFF9FF05).withOpacity(0.6),
      title: 'Contact me',
      onTap: () async {
        _scrollToIndex(5);
      },
      padding: EdgeInsets.all(4.0),
      titleStyle: TextStyle(
        color: Color(0xFF1E1B1B),
        fontSize:context.isMobile ? 22.0 : 35.0,
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

 

  _titleOffSection() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          'Hello Im',
          style: TextStyle(
            fontSize: context.isMobile ? 50 : 140,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w200,
            color: Colors.grey[800].withOpacity(0.5)
          ),
        ),
      ),
    );
  }

  
}