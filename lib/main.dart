import 'package:flutter/material.dart';
import 'package:tour_of_heroes/hero-detail.dart';
import 'package:tour_of_heroes/mock-heroes.dart';
import 'package:tour_of_heroes/model/hero.dart' as Toh;

void main() {
  runApp(MyApp());
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

class HeroesPage extends StatefulWidget {
  @override
  _HeroesPageState createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  final _heroes = HEROES;
  Toh.Hero selectedHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour of Heroes'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(
                'My Heroes',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
                child: ListView(
              children: ListTile.divideTiles(
                  context: context,
                  tiles: _heroes.map((h) => ListTile(
                        onTap: () {
                          setState(() {
                            selectedHero = h;
                          });
                        },
                        title: HeroListItem(h, h == selectedHero),
                      ))).toList(),
            )),
            HeroDetail(
              selectedHero: selectedHero,
              onNameChanged: (value) {
                setState(() {
                  selectedHero.name = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HeroListItem extends StatelessWidget {
  HeroListItem(Toh.Hero hero, bool selected)
      : _hero = hero,
        _selected = selected;
  final Toh.Hero _hero;
  final _selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(right: 8),
            child: Text(
              _hero.id.toString(),
              style: Theme.of(context).accentTextTheme.bodyText1,
            ),
          ),
        ),
        Text(
          _hero?.name,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: _selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).textTheme.bodyText2.color),
        )
      ],
    );
  }
}
