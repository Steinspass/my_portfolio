import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/widgets/container_shadow_widget.dart';
import 'package:my_portfolio/widgets/title_section_widget.dart';
import 'package:velocity_x/velocity_x.dart';



class MySkillWidget extends StatefulWidget {
  MySkillWidget({Key key}) : super(key: key);

  @override
  _MySkillWidgetState createState() => _MySkillWidgetState();
}

class _MySkillWidgetState extends State<MySkillWidget> {

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSectionWidget(title: 'Skills',),
        _buildContainerNeon()
      ],
    );
  }


  Widget _buildContainerNeon(){
    return ContainerNeonWidget(
      heightSize: returnForTypeSize(
        isMobile:  MediaQuery.of(context).size.height / 0.8,
        isTablet:  MediaQuery.of(context).size.height / 2.2,
        isDesktop: MediaQuery.of(context).size.height / 1.9,
      ),
      widthSize: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 30.0,
        isTablet: MediaQuery.of(context).size.width - 150.0,
        isDesktop: MediaQuery.of(context).size.width - 350.0, 
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
      child:  _rowOfColumnsOfSkills()    
    );
  }

  
 

  

  Widget _rowOfColumnsOfSkills() {

    final _rowSkills =  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _columnOfSkillIKnow(), flex: 1,),
          
          Expanded(child: _columnOfSkillKnowSomething(), flex: 1),
          
          Expanded(child: _columnOfSkillIWantToLearn(), flex: 1,)
        ],
      );

    final _columnSkills =  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _columnOfSkillIKnow(), flex: 1,),
          
          Expanded(child: _columnOfSkillKnowSomething(), flex: 1),
          
          Expanded(child: _columnOfSkillIWantToLearn(), flex: 1,)
        ],
      );  

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.isMobile ?  20.0  : 40.0,
        vertical: context.isMobile ?  20.0  : 20.0
      ),
      child: context.isMobile
      ? _columnSkills
      : _rowSkills
    );
  }

  Widget _columnOfSkillIKnow() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        _titleOfSkill(' Working knowledge ', Colors.greenAccent[400], returnForTypeSize(isMobile: 20, isTablet: 24, isDesktop: 34)),
        context.isMobile ? SizedBox(height: 20.0,) : SizedBox(height: 40.0,),
        _itemSkillKnow('Flutter', Colors.greenAccent[400]),
        _itemSkillKnow('Dart', Colors.greenAccent[400]),
        _itemSkillKnow('Working with APIs', Colors.greenAccent[400]),
        _itemSkillKnow('Firebase', Colors.greenAccent[400]),
        _itemSkillKnow('Git', Colors.greenAccent[400]),
        _itemSkillKnow('Kotlin', Colors.greenAccent[400]),
      ],
    );
  }

  Widget _columnOfSkillKnowSomething() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _titleOfSkill(' Know something about ', Colors.yellowAccent, returnForTypeSize(isMobile: 20, isTablet: 24, isDesktop: 34)),
        context.isMobile ? SizedBox(height: 20.0,) : SizedBox(height: 40.0,),
        _itemSkillKnow('Java', Colors.yellowAccent),
        _itemSkillKnow('Python', Colors.yellowAccent),
        _itemSkillKnow('Figma', Colors.yellowAccent),
        _itemSkillKnow('CSS', Colors.yellowAccent),
        _itemSkillKnow('HTML', Colors.yellowAccent),
        _itemSkillKnow('TypeScript', Colors.yellowAccent),
      ],
    );
  }

  Widget _columnOfSkillIWantToLearn() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _titleOfSkill(' Want to learn ', Colors.orangeAccent[400], returnForTypeSize(isMobile: 20, isTablet: 24, isDesktop: 34)),
        context.isMobile ? SizedBox(height: 20.0,) : SizedBox(height: 40.0,),
        _itemSkillKnow('Golang', Colors.orangeAccent[400]),
        _itemSkillKnow('JavaScript', Colors.orangeAccent[400]),
        _itemSkillKnow('React Native', Colors.orangeAccent[400]),
        _itemSkillKnow('React', Colors.orangeAccent[400]),
        _itemSkillKnow('Vue', Colors.orangeAccent[400]),
        _itemSkillKnow('Machine Learning', Colors.orangeAccent[400]),
      ],
    );
  }

  Widget _titleOfSkill(String title, Color color, double fontSize) {
    return Align(
      alignment: Alignment.center,
      child: SelectableText(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: fontSize,
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

  Widget _itemSkillKnow(String name, Color color) {

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 0.0
      ),
      visualDensity: context.isMobile ? VisualDensity.compact : VisualDensity.comfortable,
      dense: context.isMobile ? true : false,
      leading: Icon(
        Feather.play,
        color: color,
        size: returnForTypeSize(isMobile: 20, isTablet: 25, isDesktop: 30)
        ),
      title: Text(
        name,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26),
            fontWeight: FontWeight.w500,
          ),
        ),
    );  
  }

  


}