import 'package:flutter/material.dart';
import 'package:my_portfolio/on_hovers/distorsion_hover.dart';
import 'dart:html' as html;

import 'package:my_portfolio/on_hovers/on_hover.dart';


extension HoverExtensions on Widget {
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, // the widget we're using the extension on
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnHover {
    return UpperOnHover(
      child: this,
    );
  }

  Widget get distorsionTitleOnHover{
    return DistorsionOnHover(
      child: this,
    );
  }

  Widget get distorsionNameAppOnHover{
    return DistorsionNameAppOnHover(
      child: this,
    );
  }
}