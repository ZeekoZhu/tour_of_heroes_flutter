import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/dashboard.page.dart';
import 'package:tour_of_heroes/message.service.dart';
import 'package:tour_of_heroes/messages.dart';

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
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _InitRoute(builder: (ctx) => DashboardPage());
          case '/heroes':
            return _InitRoute(builder: (ctx) => HeroesPage());
          default:
            return null;
        }
      },
      routes: {
        '/msg': (ctx) => Messages()
      },
    );
  }
}

class _InitRoute extends MaterialPageRoute {
  _InitRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration.zero;
}
