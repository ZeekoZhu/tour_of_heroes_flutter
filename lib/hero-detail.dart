import 'package:flutter/material.dart';
import './model/hero.dart' as Toh;

class HeroDetail extends StatelessWidget {
  HeroDetail({this.selectedHero, this.onNameChanged});

  final _textFieldController = TextEditingController();
  final Toh.Hero selectedHero;
  final ValueChanged<String> onNameChanged;

  void _handleSubmit(String value) {
    onNameChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    if (selectedHero == null) {
      return Container();
    }
    _textFieldController.text = selectedHero.name;
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
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
                  onFieldSubmitted: _handleSubmit,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
