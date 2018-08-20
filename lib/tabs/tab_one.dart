import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_app/util/icons.dart';

class TabOneWidget extends StatelessWidget {
  Widget onItemBuilder(BuildContext context, Entry entry) {
    return EntryItemWidget(entry);
  }

  Widget onItemBuilderForIndex(BuildContext context, int i) {
    //如果是奇数返回分割线
    if (i.isOdd) {
      return new Divider(height: 0.0, color: Colors.grey[500]);
    }
    //偶数的话开始构建一行
    final index = i ~/ 2;
    return onItemBuilder(context, data[index]);
  }

  Iterable<Widget> onListMap(BuildContext context) {
    return data.map((Entry entry) {
      onItemBuilder(context, entry);
    });
  }

  List<Widget> divideTiles(BuildContext context) {
    return ListTile.divideTiles(context: context, tiles: onListMap(context))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) => onItemBuilderForIndex(context, index),
      itemCount: data.length,
    );
  }
}

class Entry {
  Entry(this.title, this.childTitle, this.time, this.editStatus, this.headImage,
      this.commentCount, this.likeCount, this.content, this.type);

  final String title; //标题
  final String childTitle; //子标题
  final String time; //时间
  final String editStatus; //编辑状态
  final String headImage; //图片地址
  final int commentCount; //评论个数
  final int likeCount; //点赞个数
  final ItemContentType type; //内容类型
  final Content content; //内容体
}

enum ItemContentType {
  IMAGE, //图片
  IMAGE_TEXT, //图片+文字
  IMAGE_TEXT_INTRO //图片+文字+介绍
}

class Content {
  Content(this.intro, this.url, this.title, this.childTitle, this.status,
      this.collectStatus);

  final String intro; //简介
  final String url; //图片|视频地址
  final String title; //标题
  final String childTitle; //子标题
  final int status; //发布状态
  final int collectStatus; //收藏状态
}

final List<Entry> data = [
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO),
  new Entry(
      'freeCodeCamp',
      '122927位关注者',
      '2018-08-15 12:00',
      '',
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'medium.freecodecamp.org',
          0,
          0),
      ItemContentType.IMAGE_TEXT_INTRO)
];

class EntryItemWidget extends StatelessWidget {
  EntryItemWidget(this.entry);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    Widget buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Row(
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(left: 2.5),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buildImageContent() {
      return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Image.network(entry.content.url),
      );
    }

    Widget buildImageTextContent() {
      return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            new Text(entry.content.intro),
            new Image.network(entry.content.url)
          ],
        ),
      );
    }

    Widget buildImageTextIntroContent() {
      return new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            new Text(entry.content.intro),
            new Card(
              elevation: 0.5,
              child: new Column(
                children: <Widget>[
                  new Image.network(entry.content.url),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Column(
                            children: <Widget>[
                              new Text(entry.content.title),
                              new Text(entry.content.childTitle)
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        new Icon(FontAwesomeIcons.star, size: 17.0,)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget buildContent() {
      switch (entry.type) {
        case ItemContentType.IMAGE:
          return buildImageContent();
        case ItemContentType.IMAGE_TEXT:
          return buildImageTextContent();
        case ItemContentType.IMAGE_TEXT_INTRO:
          return buildImageTextIntroContent();
      }
    }

    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: new NetworkImage(
                  entry.headImage
                ),
                radius: 25.0,
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(entry.title),
                      new Text(entry.title),
                      new Text(entry.title),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              new Icon(Icons.keyboard_arrow_down)
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          buildContent(),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildButtonColumn(Icons.share, '分享'),
                buildButtonColumn(
                    Icons.comment,
                    entry.commentCount != 0
                        ? entry.commentCount.toString()
                        : '评价'),
                buildButtonColumn(
                    LinkedInAppIcons.thumbs_up, entry.likeCount.toString())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
