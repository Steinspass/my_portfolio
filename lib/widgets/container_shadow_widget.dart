import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:velocity_x/velocity_x.dart';


class ContainerNeonWidget extends StatefulWidget {
  final double widthSize;
  final double heightSize;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Decoration decoration;
  final Widget child;

  ContainerNeonWidget({
    this.decoration,
    this.heightSize,
    @required this.widthSize,
    @required this.padding,
    @required this.margin,
    @required this.child
  });

  @override
  _ContainerNeonWidgetState createState() => _ContainerNeonWidgetState();
}

class _ContainerNeonWidgetState extends State<ContainerNeonWidget> {

  bool _hovering = false;  

  @override
  Widget build(BuildContext context) {

    final decorationDefault = BoxDecoration(
        // borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF01011F),
        boxShadow: [
          _hovering 
          ? BoxShadow(
            color: context.isMobile ?  Colors.grey[500].withOpacity(0.5)  : Colors.grey[500].withOpacity(0.6),
            blurRadius: context.isMobile ?  5.0  : 30.0,
            spreadRadius: context.isMobile ?  2.0  : 10.0,
          )
          : BoxShadow(
            color: context.isMobile ?  Colors.grey[500].withOpacity(0.5)  : Colors.grey[500].withOpacity(0.4),
            blurRadius: context.isMobile ?  5.0  : 15.0,
            spreadRadius: context.isMobile ?  2.0  : 5.0,
          )
        ],
      );

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        child: widget.child,
        width: widget.widthSize,
        height: widget.heightSize,
        padding: widget.padding,
        margin: widget.margin,
        decoration: widget.decoration == null 
          ? decorationDefault
          : widget.decoration
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}