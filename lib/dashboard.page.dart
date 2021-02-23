import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/hero.service.dart';
import './model/hero.dart' as Toh;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _heroes = <Toh.Hero>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Top Heroes',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
              children: _heroes
                  .map((h) => Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () {  },
                          child: Text(h.name),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }

  @override
  void initState() {
    getIt<HeroService>().getHeroes().then((value) {
      setState(() {
        _heroes = value.take(4);
      });
    });
  }
}
