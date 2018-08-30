import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'dart:io';

class TabThreeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabThreeWidgetState();
  }
}

class People {
  People(
      {this.id,
      this.chineseName,
      this.image,
      this.englishName,
      this.birthday,
      this.birthPlace,
      this.occupational});

  final String id;
  final String chineseName;
  final String image;
  final String englishName;
  final String birthday;
  final String birthPlace;
  final String occupational;

  People.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        chineseName = json['chineseName'],
        image = json['image'],
        englishName = json['englishName'],
        birthday = json['birthday'],
        birthPlace = json['birthPlace'],
        occupational = json['occupational'];
}

class TabThreeWidgetState extends State<TabThreeWidget> {
  List<People> mPeopleList = [];

  @override
  void initState() {
    super.initState();
    //获取数据
    _getPeopleList();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(color: Colors.black87, fontSize: 16.0);

    Widget titleWidget = new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10.0, top: 2.5, bottom: 2.5),
      child: new Row(
        children: <Widget>[
          new Text(
            '猜您认识',
            style: style,
          ),
          new FlatButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {},
            child: new Row(
              children: <Widget>[
                new Icon(FontAwesomeIcons.sprayCan),
                new Text(
                  '扫一扫',
                  style: style,
                )
              ],
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: titleWidget,
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: new List.generate(mPeopleList.length, (index) {
            return new Card(
              child: new Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  new Container(
                    child: new Icon(Icons.close),
                    alignment: Alignment.topRight,
                  ),
                  new Column(
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Image.network(mPeopleList[index].image,
                            width: 120.0, height: 120.0),
                        backgroundColor: const Color(0x00000000),
                      ),
                      new Text(mPeopleList[index].chineseName),
                      new Text(mPeopleList[index].birthPlace),
                      new RaisedButton(
                        onPressed: null,
                        child: new Text('加为好友'),
                      )
                    ],
                  )
                ],
              ),
            );
          })),
    );
  }

  void _getPeopleList() async {
    var url = 'https://ericpengtop.github.io/api/figure.json';
    var httpClient = new HttpClient();

    List<People> result = [];
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = await JSON.decode(json);
        List<dynamic> dataList = data['data'];
        for (int index = 0; index < dataList.length; index++) {
          var people = new People.fromJson(dataList[index]);
          result.add(people);
        }
      }
    } catch (ex) {
    }

    if (!mounted) {
      return;
    }

    setState(() {
      this.mPeopleList.clear();
      this.mPeopleList.addAll(result);
    });
  }
}
