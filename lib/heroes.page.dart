import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tour_of_heroes/bottom-bar.dart';

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
  final _msgSvc = getIt<MessagesService>();

  handleSelect(Toh.Hero hero) {
    setState(() async {
      _msgSvc.add('HeroesComponent: Selected hero id=${hero.id}');
      await Navigator.of(context)
          .pushNamed(HeroDetailPage.routeName, arguments: hero.id);
      // reload list page
      setState(() {});
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
      bottomNavigationBar: BottomBar(1),
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
                        title: HeroListItem(h),
                      ))).toList(),
            )),
          ],
        ),
      ),
    );
  }
}

class HeroListItem extends StatelessWidget {
  HeroListItem(Toh.Hero hero) : _hero = hero;
  final Toh.Hero _hero;

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
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Theme.of(context).textTheme.bodyText2.color),
        )
      ],
    );
  }
}
