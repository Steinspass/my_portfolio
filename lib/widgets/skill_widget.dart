import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:velocity_x/velocity_x.dart';



class MySkillWidget extends StatefulWidget {
  MySkillWidget({Key key}) : super(key: key);

  @override
  _MySkillWidgetState createState() => _MySkillWidgetState();
}

class _MySkillWidgetState extends State<MySkillWidget> {

  // TODO agregar imagenes y explicacion de los servicios que doy yo
  // igual que este portfolio => https://smakosh.com/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titleOffSection(),
        // _titleOfTech(' Most recently used technologies '),
        // _rowOfIconTech(),
        _buildCard(context)
      ],
    );
  }

  _titleOffSection() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          'Skills',
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
    ? MediaQuery.of(context).size.height / 0.5
    : MediaQuery.of(context).size.height / 1.2,
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
      child: _rowOfColumnsOfSkills(),
    ),
  );

  }

   Widget _titleOfTech(String title) {
    return Align(
      alignment: Alignment.topCenter,
      child: SelectableText(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: 38.0,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          shadows: getGlitchShadowText(context),
          letterSpacing: 4.0
        ),
      ),
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
        horizontal: context.isMobile ?  20.0  : 80.0,
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
        _titleOfSkill(' Working knowledge ', Colors.greenAccent[400]),
        SizedBox(height: 20.0,),
        _itemSkillKnow('Flutter', Colors.greenAccent[400]),
        _itemSkillKnow('Dart', Colors.greenAccent[400]),
        _itemSkillKnow('Working with APIs', Colors.greenAccent[400]),
        _itemSkillKnow('Firebase', Colors.greenAccent[400]),
        _itemSkillKnow('Git', Colors.greenAccent[400]),
        _itemSkillKnow('Mobile Apps', Colors.greenAccent[400]),
        _itemSkillKnow('Kotlin', Colors.greenAccent[400]),
        _itemSkillKnow('Native Android Apps', Colors.greenAccent[400]),
      ],
    );
  }

  Widget _columnOfSkillKnowSomething() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _titleOfSkill(' Know something about ', Colors.tealAccent[700]),
        SizedBox(height: 20.0,),
        _itemSkillKnow('Java', Colors.tealAccent[700]),
        _itemSkillKnow('Python', Colors.tealAccent[700]),
        _itemSkillKnow('JavaScript', Colors.tealAccent[700]),
        _itemSkillKnow('Figma', Colors.tealAccent[700]),
        _itemSkillKnow('CSS', Colors.tealAccent[700]),
        _itemSkillKnow('HTML', Colors.tealAccent[700]),
        _itemSkillKnow('TypeScript', Colors.tealAccent[700]),
        _itemSkillKnow('MySQL', Colors.tealAccent[700]),
      ],
    );
  }

  Widget _columnOfSkillIWantToLearn() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _titleOfSkill(' Want to learn ', Colors.deepPurpleAccent[400]),
        SizedBox(height: 20.0,),
        _itemSkillKnow('React Native', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('MongoDB', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('Docker', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('Linux Command line', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('React', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('Vue', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('Angular', Colors.deepPurpleAccent[400]),
        _itemSkillKnow('Machine Learning', Colors.deepPurpleAccent[400]),
      ],
    );
  }

  Widget _titleOfSkill(String title, Color color) {
    return Align(
      alignment: Alignment.center,
      child: SelectableText(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontSize: context.isMobile ? 22 : 36.0,
          fontWeight: FontWeight.w700,
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
        Icons.details,
        color: color,
        size: context.isMobile ? 20.0  : 30.0,
        ),
      title: Text(
        name,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: context.isMobile ? 16.0 : 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
    );  
  }

  


}