import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class DistorsionOnHover extends StatefulWidget {
  final Widget child;
  DistorsionOnHover({Key key, this.child}) : super(key: key);

  @override
  _DistorsionOnHoverState createState() => _DistorsionOnHoverState();
}

class _DistorsionOnHoverState extends State<DistorsionOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -1, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: _hovering ? _titleNameDistorsion() : widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

   Widget _titleNameDistorsion() {
    return Center(
      child: FadeAnimatedTextKit(
        text: [
          " N41m 9r1d1 70947e6r4 ",
          " #@1= 9<1}1 70947>6<4 ",
          " N41m 9r1d1 70947e6r4 ",
          " Naim Dridi Podadera "
        ],
        // speed: Duration(milliseconds: 5),
        duration: Duration(milliseconds: 45),
        pause: Duration(milliseconds: 8),
        isRepeatingAnimation: false,
        repeatForever: false,
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.centerStart,
          textStyle: TextStyle(
          fontSize: context.isMobile ? 35 : 90,
          color: Colors.white,
          letterSpacing: context.isMobile ? -0.5 : -1.5,
          fontWeight: FontWeight.w400,
          shadows: _getGlitchShadowText()
        ),
        onFinished: () => _mouseEnter(false),    
        ),
    );
  }

  List<Shadow> _getGlitchShadowText(){
    final glitchWeb = [
      Shadow(
        color: Colors.greenAccent[400],
        blurRadius: 20.0,
        offset: Offset(4.5, 4.4),
      ),
      Shadow(
        color: Colors.blueAccent[400],
        blurRadius: 20.0,
        offset: Offset(-4.5, 4.4),
      ),
      Shadow(
        color: Colors.redAccent[400],
        blurRadius: 20.0,
        offset: Offset(4.5, -4.4),
      ),
    ];

    final glitchMobile = [
      Shadow(
        color: Colors.greenAccent[400],
        blurRadius: 1.0,
        offset: Offset(3.0, 3.0),
      ),
      Shadow(
        color: Colors.blueAccent[400],
        blurRadius: 1.0,
        offset: Offset(-3.0, 3.0),
      ),
      Shadow(
        color: Colors.redAccent[400],
        blurRadius: 1.0,
        offset: Offset(3.0, -3.0),
      ),
    ];

    return context.isMobile ? glitchMobile : glitchWeb; 
  }
}


class DistorsionNameAppOnHover extends StatefulWidget {
  final Widget child;
  DistorsionNameAppOnHover({Key key, this.child}) : super(key: key);

  @override
  _DistorsionNameAppOnHoverState createState() => _DistorsionNameAppOnHoverState();
}

class _DistorsionNameAppOnHoverState extends State<DistorsionNameAppOnHover> {
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0, -1, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: _hovering ? _titleNameDistorsion() : widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

   Widget _titleNameDistorsion() {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 500.0,
        child: FadeAnimatedTextKit(
          text: [
            " 8un54L15t ",
            " 8~#54!15} ",
            " 8un54L15t ",
            " BunkaList "
          ],
          duration: Duration(milliseconds: 45),
          // speed: Duration(milliseconds: 5),
          pause: Duration(milliseconds: 10),
          isRepeatingAnimation: false,
          repeatForever: false,
            textStyle: TextStyle(
               fontSize: context.isMobile ? 30 : 60,
               color: Colors.white,
               letterSpacing: context.isMobile ? -0.5 : -1.5,
               fontWeight: FontWeight.w800,
               shadows: _getGlitchShadowText(),
             ),
          onFinished: () => _mouseEnter(false),    
          ),
      ),
    );
  }

  List<Shadow> _getGlitchShadowText(){
    final glitchWeb = [
      Shadow(
        color: Colors.greenAccent[400],
        blurRadius: 5.0,
        offset: Offset(2.5, 2.4),
      ),
      Shadow(
        color: Colors.blueAccent[400],
        blurRadius: 5.0,
        offset: Offset(-2.5, 2.4),
      ),
      Shadow(
        color: Colors.redAccent[400],
        blurRadius: 5.0,
        offset: Offset(2.5, -2.4),
      ),
    ];

    final glitchMobile = [
      Shadow(
        color: Colors.greenAccent[400],
        blurRadius: 1.0,
        offset: Offset(3.0, 3.0),
      ),
      Shadow(
        color: Colors.blueAccent[400],
        blurRadius: 1.0,
        offset: Offset(-3.0, 3.0),
      ),
      Shadow(
        color: Colors.redAccent[400],
        blurRadius: 1.0,
        offset: Offset(3.0, -3.0),
      ),
    ];

    return context.isMobile ? glitchMobile : glitchWeb; 
  }
}