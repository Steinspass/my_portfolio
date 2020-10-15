import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/type_screen_size.dart';

import 'package:velocity_x/velocity_x.dart';


class TitleSectionWidget extends StatelessWidget {

  final String title;

  const TitleSectionWidget({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 45.0, left: 20.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: returnForTypeSize(
              isMobile: 80,
              isTablet: 120,
              isDesktop: 160
            ),
            letterSpacing: 2.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[700].withOpacity(0.5)
          ),
        ),
      ),
    );
  }
}