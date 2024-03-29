import 'package:coletor_nativo/controller/dark_mode.dart';
import 'package:coletor_nativo/widgets/theme_data.dart';

import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final String title = 'Coletor';
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: DarkMode.instance,
        builder: (context, child) {
          return ThemeData2(
            home: MyHomePage(title: title),
          );
        });
  }
}
