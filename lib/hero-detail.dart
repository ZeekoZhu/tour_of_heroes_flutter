import 'package:flutter/material.dart';
import 'package:tour_of_heroes/hero.service.dart';
import './model/hero.dart' as Toh;
import 'app.module.dart';

class HeroDetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _HeroDetailPageState createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  Toh.Hero selectedHero;
  final _textFieldController = TextEditingController();

  void _handleNameChanged(String name) {
    setState(() {
      selectedHero.name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    _textFieldController.text = selectedHero.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (selectedHero.name.toUpperCase()) + ' Details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: [
                Text('ID: ', style: Theme.of(context).textTheme.bodyText1),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      selectedHero.id.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Flexible(
                      child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Input name',
                        border: OutlineInputBorder(),
                        labelText: 'name'),
                    controller: _textFieldController,
                    onFieldSubmitted: _handleNameChanged,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // allow access ModalRoute.of() inside initState
    Future.delayed(Duration.zero, () async {
      int heroId = ModalRoute.of(context).settings.arguments;
      final hero = await getIt<HeroService>().getHero(heroId);
      setState(() {
        selectedHero = hero;
      });
    });
  }
}
