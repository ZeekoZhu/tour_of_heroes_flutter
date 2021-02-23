import 'package:flutter/material.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/message.service.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Messages',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.redAccent),
          ),
          FlatButton(onPressed: () {
            getIt<MessagesService>().clear();
          }, child: Text('clear'))
        ],
      ),
    );
  }
}
