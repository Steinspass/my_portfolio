import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

List<Shadow> getGlitchShadowText(BuildContext context){
    final glitchWeb = [
      Shadow(
        color: Colors.greenAccent[400].withOpacity(0.8),
        blurRadius: 1.0,
        offset: Offset(2.0, 2.0),
      ),
      Shadow(
        color: Colors.blueAccent[400].withOpacity(0.8),
        blurRadius: 1.0,
        offset: Offset(-2.0, 2.0),
      ),
      Shadow(
        color: Colors.redAccent[400].withOpacity(0.8),
        blurRadius: 1.0,
        offset: Offset(2.0, -2.0),
      ),
    ];

    final glitchMobile = [
      Shadow(
        color: Colors.greenAccent[400].withOpacity(0.6),
        blurRadius: 1.0,
        offset: Offset(1.0, 1.0),
      ),
      Shadow(
        color: Colors.blueAccent[400].withOpacity(0.6),
        blurRadius: 1.0,
        offset: Offset(-1.0, 1.0),
      ),
      Shadow(
        color: Colors.redAccent[400].withOpacity(0.6),
        blurRadius: 1.0,
        offset: Offset(1.0, -1.0),
      ),
    ];

    return context.isMobile ? glitchMobile : glitchWeb; 
  }