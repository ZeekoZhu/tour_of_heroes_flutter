import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/message.service.dart';

import 'heroes.page.dart';

void main() {
  configureDependencies();
  runApp(ChangeNotifierProvider(
      create: (ctx) => getIt<MessagesService>(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HeroesPage());
  }
}


