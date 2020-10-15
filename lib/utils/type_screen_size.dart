

import 'package:flutter/material.dart';

dynamic returnForTypeSize({dynamic isMobile,dynamic isTablet, dynamic isDesktop}){
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  double screenSize = data.size.width;

    if(screenSize < 800){
      return isMobile;
    }

    if(screenSize >= 800 && screenSize<= 1200){
      return isTablet;
    }

    if(screenSize > 1200){
      return isDesktop;
    }
  }