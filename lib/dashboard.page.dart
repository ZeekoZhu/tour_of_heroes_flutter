import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/bottom-bar.dart';
import 'package:tour_of_heroes/hero-detail.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      bottomNavigationBar: BottomBar(0),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Top Heroes',
              style: Theme.of(context).textTheme.headline6,
            ),
            Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: _heroes
                    .map((h) => FractionallySizedBox(
                          widthFactor: 0.48,
                          child: OutlinedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed(
                                  HeroDetailPage.routeName,
                                  arguments: h.id);
                              setState(() {});
                            },
                            child: Text(h.name),
                          ),
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      getIt<HeroService>().getHeroes().then((value) {
        setState(() {
          _heroes = value.take(4).toList();
        });
      });
    });
  }
}
