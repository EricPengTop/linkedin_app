import 'package:flutter/material.dart';

class TabFiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    Widget header = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new NetworkImage(
                'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
            radius: 50.0,
          )
        ],
      ),
      height: 180.0,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: NetworkImage(
                'http://5b0988e595225.cdn.sohucs.com/images/20170913/089d5ddc894f47009a31d895efa906e3.jpeg'),
            fit: BoxFit.cover,
            alignment: Alignment.center),
      ),
    );

    return new Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          header,
          buildItem(Icons.looks, '谁看过我', "2"),
          buildItem(Icons.looks, '搜索分析', ""),
          buildItem(Icons.looks, '领英奖励', ""),
          new Divider(),
          buildItem(Icons.looks, '动态、关注与收藏', ""),
          buildItem(Icons.looks, '求职管理', ""),
          buildItem(Icons.looks, '我的红包', ""),
          buildItem(Icons.looks, '我的名片', ""),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon, String label, String value) {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(right: 16.0),
            child: new Icon(icon),
          ),
          new Expanded(
            child: new Text(label),
          ),
          new Padding(
            padding: new EdgeInsets.only(right: 10.0),
            child: new Text(value),
          ),
          new Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
