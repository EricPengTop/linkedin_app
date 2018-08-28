import 'package:flutter/material.dart';
import 'package:linkedin_app/local/linkedin_localizations.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Icon(Icons.arrow_back)
        ),
        title: new TextFormField(
          style: new TextStyle(
            color: Colors.black87,
            fontSize: 16.0
          ),
          decoration: new InputDecoration(
            hintText: LinkedInLocalizations.of(context).searchHint,
          ),
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0.0,
      ),
      body: new Center(
        child: new FlatButton(
          child: new Text('返回'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
