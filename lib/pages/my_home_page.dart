import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_portfolio/ui_components/particles_background.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/widgets/about_widget.dart';
import 'package:my_portfolio/widgets/contact_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/menu_widget.dart';
import 'package:my_portfolio/widgets/my_working_apps.dart';
import 'package:my_portfolio/widgets/skill_widget.dart';
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

  bool _hovering = false;

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
        color: Colors.black,
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
                  child: MySkillWidget()
                ),
                _wrapScrollTag(
                  index: 3,
                  child: AboutMeWidget()
                ),
                _wrapScrollTag(
                  index: 4,
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
      padding: const EdgeInsets.all(4.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: (){
              _scrollToIndex(0);
            },
          child: Text(
            " naimdev.tech ",
              style: TextStyle(
                fontSize: context.isMobile ? 18 : 24,
                color: Colors.yellowAccent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
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
      hoverColor: Colors.yellowAccent,
      mini: context.isMobile ? true : false,
      hoverElevation: 15.0,
      backgroundColor: Colors.yellowAccent.withOpacity(0.8),
      elevation: 1.0,
      tooltip: "Open Menu",
      child: Icon(
        Icons.menu,
        color: Colors.blueGrey[900],
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
            child: AnimatedBackground(
              behaviour: MyRacingLinesBehaviour(
                direction: LineDirection.Ttb,
                numLines: context.isMobile ? 15 : 250
              ),
              vsync: this,
              child: _columnMiddle(),
            ),
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
        Spacer(),
        _titleOffSection(),
        _titleMyName(),
        _subtitleDev(),
        SizedBox(height: 25.0,),
        _buttonContactMe(),
        Spacer(),
        // _iconArrowDown(),
      ],
    );
  }

 

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
            fontSize: context.isMobile ? 40 : 100,
            color: Colors.white,
            letterSpacing: context.isMobile ? -0.5 : -1.5,
            fontWeight: FontWeight.w900,
            shadows: getGlitchShadowText(context)
          ),  
        ),
    ).showCursorOnHover.distorsionTitleOnHover;
  }

  Widget _subtitleDev() {


    return SizedBox(
      width: 1500.0,
      child: FadeAnimatedTextKit(
        text: [
          " Freelancer App Mobile Developer",
          " Self-taught Software Developer ",
          " I create interactive experiences with modern tech.",
          
        ],
        textStyle: TextStyle(
            fontSize: context.isMobile ? 25 : 55,
            letterSpacing:context.isMobile ? 1.5 : 3.0,
            color: Colors.yellowAccent,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            shadows: getGlitchShadowText(context)
        ), 
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.centerStart,
        repeatForever: true,
        pause: Duration(milliseconds: 1000),
        duration: Duration(milliseconds: 1000),   
      ),
    );
  }


  Widget _buttonContactMe(){

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
                depth: _hovering ? 20 : 5,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(5.0)
                ),
                lightSource: LightSource.bottomLeft,
                color: Colors.yellowAccent
              ),
              child: GestureDetector(
                onTap: () async {
                  _scrollToIndex(4);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (e) => _mouseEnter(true),
                  onExit: (e) => _mouseEnter(false),
                  child: Container(
                    margin: context.isMobile 
                    ? EdgeInsets.all(5.0)
                    : EdgeInsets.all(15.0),
                    child: Text(
                      "Contact me",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:context.isMobile ? 22.0 : 35.0,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                ),
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
            fontSize: context.isMobile ? 60 : 160,
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800].withOpacity(0.3)
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}