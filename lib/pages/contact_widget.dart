import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/ui_components/shadow_text.dart';
import 'package:my_portfolio/utils/send_email_manager.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';
import 'package:my_portfolio/utils/validator_email.dart';
import 'package:my_portfolio/widgets/button_neon_widget.dart';
import 'package:my_portfolio/widgets/container_shadow_widget.dart';
import 'package:my_portfolio/widgets/title_section_widget.dart';
import 'package:velocity_x/velocity_x.dart';


class ContactMeWidget extends StatefulWidget {
  ContactMeWidget({Key key}) : super(key: key);

  @override
  _ContactMeWidgetState createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {


  
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
          TitleSectionWidget(title: 'Contact',),
          _titleIntro(' Got a project idea and want to turn it into a reality? Let\'s make it happen! '),
          _nameTextField(),
          _emailTextField(),
          _messageTextField(),
          SizedBox(height: 60.0,),
          _buttonNeonContactMe(),
          // _buttonContactMe(),
          SizedBox(height: 80.0,),
        ],
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
            fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26),
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            shadows: getGlitchShadowText(context)
          ),
          ),
      ),
    );
  }

  Widget _containerNeonTextField({Widget child, bool isCliked}){

    List<BoxShadow> boxShadowNoCliked = [
          BoxShadow(
            color: context.isMobile ?  Colors.grey[600].withOpacity(0.5)  : Colors.grey[600].withOpacity(0.4),
            blurRadius: context.isMobile ?  5.0  : 6.0,
            spreadRadius: context.isMobile ?  2.0  : 3.0,
          )
        ];
    List<BoxShadow> boxShadowCliked = [
          BoxShadow(
            color: context.isMobile ?  Colors.grey[600].withOpacity(0.5)  : Colors.grey[600].withOpacity(0.4),
            blurRadius: context.isMobile ?  15.0  : 25.0,
            spreadRadius: context.isMobile ?  8.0  : 15.0,
          ),
          BoxShadow(
            color: Colors.yellowAccent,
            blurRadius:  1.0,
            spreadRadius: 2.0
          ),
        ];    

    return ContainerNeonWidget(
      child: child,
      widthSize: returnForTypeSize(
        isMobile: MediaQuery.of(context).size.width - 40.0,
        isTablet: MediaQuery.of(context).size.width - 60.0,
        isDesktop: MediaQuery.of(context).size.width / 2.20,
      ), 
      padding: const EdgeInsets.only(left: 10.0, right: 0.0),
      margin: returnForTypeSize(
        isMobile: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0
        ),
        isTablet: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 25.0
        ),
        isDesktop: const EdgeInsets.symmetric(
          horizontal: 60.0,
          vertical: 30.0
        ),
      ),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF01011F),
        boxShadow: isCliked 
          ? boxShadowCliked
          : boxShadowNoCliked 
      ),  
    );
  }

  Widget _nameTextField(){
    return _containerNeonTextField(
      isCliked: isClickedName,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              // validator: (_) {
              //  return _nameController.text ?? 'client'; 
              // },
              controller: _nameController,
              obscureText: false,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your Name',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
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
    );
  }

  Widget _emailTextField(){
    return _containerNeonTextField(
      isCliked: isClickedEmail,
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        new Expanded(
          child: TextFormField(
            validator: (_) {
             return !Validators.isValidEmail(_emailController.text)
              ? 'Possibly the email is not correctly written'
              : null;
            },
            controller: _emailController,
            obscureText: false,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26) ),
            decoration: InputDecoration(
              // errorText: 'Possibly the email is not correctly written',
              errorStyle: TextStyle(color: Colors.redAccent[400], fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
              border: InputBorder.none,
              hintText: 'Your Email',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
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
    ); 
  }

  Widget _messageTextField(){
    return _containerNeonTextField(
      isCliked: isClickedMessage,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: TextFormField(
              validator: (_) {
                
               return _messageController.text.isEmpty 
               ? "Tell me some details so I can help you"
               : null; 
              },
              controller: _messageController,
              obscureText: false,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26) ),
              decoration: InputDecoration(
                // errorText: 'Tell me some details so I can help you',
                errorStyle: TextStyle(color: Colors.redAccent[400], fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
                border: InputBorder.none,
                hintText: 'Tell me some details about your idea',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: returnForTypeSize(isMobile: 18, isTablet: 22, isDesktop: 26)),
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
    );
  }

  Widget _buttonNeonContactMe(){
    return ButtonNeonWidget(
      buttonColor: Color(0xFFF9FF05),
      shadowColor: Color(0xFFF9FF05).withOpacity(0.6),
      title: 'Get in touch',
      onTap: () {

        if (_formKey.currentState.validate()){
          SendEmailManager(
        name: _nameController.text.isNotEmpty ? _nameController.text : "client",
        email: _emailController.text,
        message: _messageController.text
        ).launchMailto();

        _nameController.clear();
        _emailController.clear();
        _messageController.clear(); 
        }

      },
      padding: EdgeInsets.all(4.0),
      titleStyle: TextStyle(
        color: Color(0xFF1E1B1B),
        fontSize: returnForTypeSize(isMobile: 20, isTablet: 24, isDesktop: 30),
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

  // Widget _nameTextField(){
    
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 1.30,
  //     child: new Neumorphic(
  //             margin: context.isMobile
  //             ? EdgeInsets.symmetric(
  //               horizontal: 10.0,
  //               vertical: 20.0
  //             )
  //             : EdgeInsets.symmetric(
  //               horizontal: 300.0,
  //               vertical: 20.0
  //             ),
  //             style: NeumorphicStyle(
  //               border: NeumorphicBorder(
  //                 color: Colors.yellowAccent,
  //                 isEnabled: isClickedName,
  //                 width: 1.0
  //               ),
  //               shadowDarkColor: Colors.grey[900],
  //               shadowLightColor: Colors.grey[900],
  //               shape: NeumorphicShape.concave,
  //               depth: 20,
  //               boxShape: NeumorphicBoxShape.roundRect(
  //                 BorderRadius.circular(5.0)
  //               ),
  //               lightSource: LightSource.bottomLeft,
  //               color: Color(4279374354).withOpacity(0.4)
  //             ),
  //             padding: const EdgeInsets.only(left: 10.0, right: 0.0),
  //             child: new Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 new Expanded(
  //                   child: TextFormField(
  //                     validator: (_) {
  //                      return _nameController.text ?? ''; 
  //                     },
  //                     controller: _nameController,
  //                     obscureText: false,
  //                     textAlign: TextAlign.left,
  //                     style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
  //                     decoration: InputDecoration(
  //                       border: InputBorder.none,
  //                       hintText: 'Your Name',
  //                       hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
  //                     ),

  //                     onTap: (){
  //                       isClickedMessage = false;
  //                       isClickedEmail = false;
  //                       isClickedName = true;
  //                       setState(() {});
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //   );
  // }

  


  // Widget _emailTextField(){
    
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 1.30,
  //     child: new Neumorphic(
  //             margin: context.isMobile
  //             ? EdgeInsets.symmetric(
  //               horizontal: 10.0,
  //               vertical: 20.0
  //             )
  //             : EdgeInsets.symmetric(
  //               horizontal: 300.0,
  //               vertical: 20.0
  //             ),
  //             style: NeumorphicStyle(
  //               border: NeumorphicBorder(
  //                 color: Colors.yellowAccent,
  //                 isEnabled: isClickedEmail,
  //                 width: 1.0
  //               ),
  //               shadowDarkColor: Colors.grey[900],
  //               shadowLightColor: Colors.grey[900],
  //               shape: NeumorphicShape.concave,
  //               depth: 20,
  //               boxShape: NeumorphicBoxShape.roundRect(
  //                 BorderRadius.circular(5.0)
  //               ),
  //               lightSource: LightSource.bottomLeft,
  //               color: Color(4279374354).withOpacity(0.4)
  //             ),
  //             padding: const EdgeInsets.only(left: 10.0, right: 0.0),
  //             child: new Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 new Expanded(
  //                   child: TextFormField(
  //                     validator: (_) {
  //                      return !Validators.isValidEmail(_emailController.text)
  //                             ? _emailController.text
  //                             : "possibly the email is not correctly written";
  //                     },
  //                     controller: _emailController,
  //                     obscureText: false,
  //                     textAlign: TextAlign.left,
  //                     style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
  //                     decoration: InputDecoration(
  //                       border: InputBorder.none,
  //                       hintText: 'Your Email',
  //                       hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
  //                     ),

  //                     onTap: (){
  //                       isClickedMessage = false;
  //                       isClickedName = false;
  //                       isClickedEmail = true;
  //                       setState(() {});
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //   );
  // }

  

  // Widget _messageTextField(){
    
  //   return Container(
  //     width: MediaQuery.of(context).size.width / 1.30,
  //     child: new Neumorphic(
  //            margin: context.isMobile
  //             ? EdgeInsets.symmetric(
  //               horizontal: 10.0,
  //               vertical: 20.0
  //             )
  //             : EdgeInsets.symmetric(
  //               horizontal: 300.0,
  //               vertical: 20.0
  //             ),
  //             style: NeumorphicStyle(
  //               border: NeumorphicBorder(
  //                 color: Colors.yellowAccent,
  //                 isEnabled: isClickedMessage,
  //                 width: 1.0
  //               ),
  //               shadowDarkColor: Colors.grey[900],
  //               shadowLightColor: Colors.grey[900],
  //               shape: NeumorphicShape.concave,
  //               depth: 20,
  //               boxShape: NeumorphicBoxShape.roundRect(
  //                 BorderRadius.circular(5.0)
  //               ),
  //               lightSource: LightSource.bottomLeft,
  //               color: Color(4279374354).withOpacity(0.4)
  //             ),
  //             padding: const EdgeInsets.only(left: 10.0, right: 0.0),
  //             child: new Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: <Widget>[
  //                 new Expanded(
  //                   child: TextFormField(
  //                     validator: (_) {
  //                      return _messageController.text.isEmpty 
  //                      ? "it cant be empty"
  //                      : _messageController.text; 
  //                     },
  //                     controller: _messageController,
  //                     obscureText: false,
  //                     textAlign: TextAlign.left,
  //                     style: TextStyle(color: Colors.white, fontSize: context.isMobile ? 14.0 : 24.0 ),
  //                     decoration: InputDecoration(
  //                       border: InputBorder.none,
  //                       hintText: 'Tell me some details about your idea',
  //                       hintStyle: TextStyle(color: Colors.grey[400], fontSize: context.isMobile ? 14.0 : 24.0),
  //                     ),
  //                     maxLines: 8,
  //                     maxLengthEnforced: true,
  //                     onTap: (){
  //                       isClickedEmail = false;
  //                       isClickedName = false;
  //                       isClickedMessage = true;
  //                       setState(() {});
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //   );
  // }

  
  
  

  // Widget _buttonContactMe(){

  //   return Container(
  //     width: context.isMobile
  //     ? MediaQuery.of(context).size.width / 1.80
  //     : MediaQuery.of(context).size.width / 2.80,
  //     child: new Neumorphic(
  //             margin: context.isMobile
  //             ? EdgeInsets.symmetric(
  //               horizontal: 1.0,
  //               vertical: 1.0
  //             )
  //             : EdgeInsets.symmetric(
  //               horizontal: 100.0,
  //               vertical: 20.0
  //             ),
  //             style: NeumorphicStyle(
  //               shadowDarkColor: Colors.yellowAccent,
  //               shadowLightColor: Colors.yellowAccent,
  //               shape: NeumorphicShape.convex,
  //               depth: 20,
  //               boxShape: NeumorphicBoxShape.roundRect(
  //                 BorderRadius.circular(5.0)
  //               ),
  //               lightSource: LightSource.bottomLeft,
  //               color: Colors.yellowAccent
  //             ),
  //             child: GestureDetector(
  //               onTap: () => {
  //                 SendEmailManager(
  //                 name: _nameController.text.isNotEmpty ? _nameController.text : "client" ,
  //                 email: _emailController.text,
  //                 message: _messageController.text
  //                 ).launchMailto(),

  //                 _nameController.clear(),
  //                 _emailController.clear(),
  //                 _messageController.clear()
  //               },
  //               child: MouseRegion(
  //                 cursor: SystemMouseCursors.click,
  //                 child: Container(
  //                   margin: context.isMobile 
  //                   ? EdgeInsets.all(5.0)
  //                   : EdgeInsets.all(15.0),
  //                   child: Text(
  //                     " Get in touch ",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:context.isMobile ? 20.0 : 30.0,
  //                       fontWeight: FontWeight.bold,
                        
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //   );
  // }  
}