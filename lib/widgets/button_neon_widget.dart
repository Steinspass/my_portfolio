import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';


class ButtonNeonWidget extends StatefulWidget {

  final double widthSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color buttonColor;
  final Color shadowColor;
  final EdgeInsetsGeometry marginTitle;
  final TextStyle titleStyle;
  final String title;
  final Function onTap;

  ButtonNeonWidget({
    @required this.widthSize,
    @required this.padding,
    @required this.margin,
    @required this.buttonColor,
    @required this.shadowColor,
    @required this.title,
    @required this.marginTitle,
    @required this.titleStyle,
    @required this.onTap
  });

  @override
  _ButtonNeonWidgetState createState() => _ButtonNeonWidgetState();
}

class _ButtonNeonWidgetState extends State<ButtonNeonWidget> {

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthSize,
      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: Container(
            margin: widget.margin,
            padding: widget.padding,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(5.0),
              color: widget.buttonColor,
              boxShadow: [
                _hovering 
                ? BoxShadow(
                  color: widget.shadowColor,
                  blurRadius: context.isMobile ?  15.0  : 30.0,
                  spreadRadius:context.isMobile ?  6.0  : 15.0,
                )
                : BoxShadow(
                  color: widget.shadowColor,
                  blurRadius: context.isMobile ?  8.0  : 5.0,
                  spreadRadius:context.isMobile ?  3.0  : 4.0,
                )
              ]
            ),
            child: Container(
              margin: widget.marginTitle,
              child: Text(
                widget.title,
                style: widget.titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
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