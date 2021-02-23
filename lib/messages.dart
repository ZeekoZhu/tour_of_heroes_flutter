import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_of_heroes/app.module.dart';
import 'package:tour_of_heroes/message.service.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        actions: [
          FlatButton(
              onPressed: () {},
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).accentTextTheme.bodyText1.color,
                ),
                onPressed: () {
                  getIt<MessagesService>().clear();
                },
              ))
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Consumer<MessagesService>(
              builder: (ctx, value, child) {
                var messages = value.messages;
                return ListView(
                    children: ListTile.divideTiles(
                        context: ctx,
                        tiles: messages
                            .map((m) => ListTile(title: Text(m)))).toList());
              },
            ))
          ],
        ),
      ),
    );
  }
}
