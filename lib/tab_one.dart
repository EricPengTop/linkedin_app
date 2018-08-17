import 'package:flutter/material.dart';

class TabOneWidget extends StatelessWidget {
  Widget onItemBuilder(BuildContext context, int index) {
    return EntryItemWidget(data[index]);
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          onItemBuilder(context, index),
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
      'https://cdn-images-1.medium.com/max/1200/1*B6_f-_SxscJ9FCuIjOrQAQ.jpeg',
      200,
      500,
      new Content(
          'Do not settle: how you can match your JavaScript collection to your goals.',
          'https://s3.amazonaws.com/freecodecamp/favicons/android-chrome-192x192.png',
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
    return new Container(
      color: Colors.grey[400],
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Image.network(entry.headImage, width: 60.0, height: 60.0),
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Text(entry.title),
                    new Text(entry.title),
                    new Text(entry.title),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              new Icon(Icons.keyboard_arrow_down)
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          new Text(entry.content.intro),

        ],
      ),
    );
  }
}
