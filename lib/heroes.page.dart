import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app.module.dart';
import 'hero-detail.dart';
import 'hero.service.dart';
import 'message.service.dart';
import 'model/hero.dart' as Toh;

class HeroesPage extends StatefulWidget {
  @override
  _HeroesPageState createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  List<Toh.Hero> _heroes = [];
  Toh.Hero selectedHero;
  final _msgSvc = getIt<MessagesService>();

  handleSelect(Toh.Hero hero) {
    setState(() {
      selectedHero = hero;
      _msgSvc.add('HeroesComponent: Selected hero id=${hero.id}');
    });
  }

  @override
  void initState() {
    super.initState();
    getIt<HeroService>().getHeroes().then((value) {
      setState(() {
        _heroes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour of Heroes'),
        actions: [
          Consumer<MessagesService>(
              builder: (BuildContext context, value, Widget child) {
            return FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/msg");
                },
                child: Text('Msg: ' + value.messages.length.toString(),
                    style: Theme.of(context).accentTextTheme.bodyText1));
          }),
        ],
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
                        onTap: () => handleSelect(h),
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
