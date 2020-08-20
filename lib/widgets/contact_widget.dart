import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/send_email_manager.dart';
import 'package:my_portfolio/utils/validator_email.dart';
import 'package:velocity_x/velocity_x.dart';


class ContactMeWidget extends StatefulWidget {
  ContactMeWidget({Key key}) : super(key: key);

  @override
  _ContactMeWidgetState createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {

 /// https://iconos8.es/icons/set/flutter
 /// https://iconos8.es/icons/set/google-firebase-console
 /// Atribucion por los iconos

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool isClickedName = false;
  bool isClickedEmail = false;
  bool isClickedMessage = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _titleOffSection(),
          _titleIntro(' Got a project idea and want to turn it into a reality? Let\'s make it happen! '),
          _nameTextField(),
          _emailTextField(),
          _messageTextField(),
          SizedBox(height: 60.0,),
          _buttonContactMe(),
          SizedBox(height: 80.0,),
        ],
      ),
    );
  }

  _titleOffSection() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          'Contact',
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

  Widget _titleIntro(String title) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: context.isMobile
        ? EdgeInsets.all(20.0)
        : EdgeInsets.all(40.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: context.isMobile ? 18.0 : 30.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            shadows: getGlitchShadowText(context)
          ),
          ),
      ),
    );
  }

  Widget _nameTextField(){
    
    return Container(
      width: MediaQuery.of(context).size.width / 1.30,
      child: new Neumorphic(
              margin: context.isMobile
              ? EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0
              )
              : EdgeInsets.symmetric(
                horizontal: 300.0,
                vertical: 20.0
              ),
              style: NeumorphicStyle(
                border: NeumorphicBorder(
                  color: Colors.yellowAccent,
                  isEnabled: isClickedName,
                  width: 1.0
                ),
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
              padding: const EdgeInsets.only(left: 10.0, right: 0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      validator: (_) {
                       return _nameController.text ?? ''; 
                      },
                      controller: _nameController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Name',
                        hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
                      ),

                      onTap: (){
                        isClickedMessage = false;
                        isClickedEmail = false;
                        isClickedName = true;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }


  Widget _emailTextField(){
    
    return Container(
      width: MediaQuery.of(context).size.width / 1.30,
      child: new Neumorphic(
              margin: context.isMobile
              ? EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0
              )
              : EdgeInsets.symmetric(
                horizontal: 300.0,
                vertical: 20.0
              ),
              style: NeumorphicStyle(
                border: NeumorphicBorder(
                  color: Colors.yellowAccent,
                  isEnabled: isClickedEmail,
                  width: 1.0
                ),
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
              padding: const EdgeInsets.only(left: 10.0, right: 0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      validator: (_) {
                       return !Validators.isValidEmail(_emailController.text)
                              ? _emailController.text
                              : "possibly the email is not correctly written";
                      },
                      controller: _emailController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Email',
                        hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
                      ),

                      onTap: (){
                        isClickedMessage = false;
                        isClickedName = false;
                        isClickedEmail = true;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _messageTextField(){
    
    return Container(
      width: MediaQuery.of(context).size.width / 1.30,
      child: new Neumorphic(
             margin: context.isMobile
              ? EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0
              )
              : EdgeInsets.symmetric(
                horizontal: 300.0,
                vertical: 20.0
              ),
              style: NeumorphicStyle(
                border: NeumorphicBorder(
                  color: Colors.yellowAccent,
                  isEnabled: isClickedMessage,
                  width: 1.0
                ),
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
              padding: const EdgeInsets.only(left: 10.0, right: 0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      validator: (_) {
                       return _messageController.text.isEmpty 
                       ? "it cant be empty"
                       : _messageController.text; 
                      },
                      controller: _messageController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tell me some details about your idea',
                        hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
                      ),
                      maxLines: 8,
                      maxLengthEnforced: true,
                      onTap: (){
                        isClickedEmail = false;
                        isClickedName = false;
                        isClickedMessage = true;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
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
                depth: 20,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(5.0)
                ),
                lightSource: LightSource.bottomLeft,
                color: Colors.yellowAccent
              ),
              child: GestureDetector(
                onTap: () => {
                  SendEmailManager(
                  name: _nameController.text.isNotEmpty ? _nameController.text : "client" ,
                  email: _emailController.text,
                  message: _messageController.text
                  ).launchMailto(),

                  _nameController.clear(),
                  _emailController.clear(),
                  _messageController.clear()
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: context.isMobile 
                    ? EdgeInsets.all(5.0)
                    : EdgeInsets.all(15.0),
                    child: Text(
                      " Get in touch ",
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