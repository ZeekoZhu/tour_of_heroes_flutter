import 'package:flutter/material.dart';
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
  final _hero = Toh.Hero(id: 0, name: '');
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour of Heroes'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _hero.name.toUpperCase() + ' Details',
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: [
                Text('ID: ', style: Theme.of(context).textTheme.bodyText1),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      _hero.id.toString(),
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
                    onFieldSubmitted: _handleSubmit,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String value) {
    setState(() {
      _hero.name = value;
    });
  }
}
