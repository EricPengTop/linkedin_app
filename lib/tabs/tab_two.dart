import 'package:flutter/material.dart';
import 'package:linkedin_app/local/linkedin_localizations.dart';
import 'dart:async';

class TabTwoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabTwoWidgetState();
  }
}

class _TabTwoWidgetState extends State<TabTwoWidget> with SingleTickerProviderStateMixin {
  static List<Widget> tabs = [new JobDiscoveryWidget(), new WorkExperienceWidget()]; //tab个数

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabs.length,
        child: new Column(
          children: <Widget>[
            new Container(
              height: 48.0,
              color: Colors.white,
              child: new TabBar(
                key: new PageStorageKey<Type>(TabBar),
                tabs: <Widget>[
                  new Tab(text: LinkedInLocalizations.of(context).jobDiscovery),
                  new Tab(text: LinkedInLocalizations.of(context).workExperience),
                ],
                labelColor: Colors.black87,
                labelStyle: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
            ),
            new Expanded(
              child: new TabBarView(
                key: new PageStorageKey<Type>(TabBarView),
                children: tabs,
              ),
            )
          ],
        ));
  }
}

class JobDiscoveryWidget extends StatefulWidget {

  JobDiscoveryWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JobDiscoveryWidgetState();
  }
}

class _JobDiscoveryWidgetState extends State<JobDiscoveryWidget> with SingleTickerProviderStateMixin {

  static const List<Banner> bannerList = const <Banner>[
    const Banner(title: '一键打开求职状态，老板不见猎头见', image: 'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
    const Banner(title: '一键打开求职状态，老板不见猎头见', image: 'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
    const Banner(title: '一键打开求职状态，老板不见猎头见', image: 'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
    const Banner(title: '一键打开求职状态，老板不见猎头见', image: 'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
    const Banner(title: '一键打开求职状态，老板不见猎头见', image: 'http://cruxcrush.com/wp-content/uploads/2015/12/nine.png'),
  ];

  TabController _tabController;
  Timer timer;

  void _handleArrow(BuildContext context, int delta) {
    if (_tabController.index == bannerList.length - 1) {
      _tabController.index = 0;
      _tabController.animateTo(_tabController.index);
    } else if (!_tabController.indexIsChanging) {
      int index = (_tabController.index + delta).clamp(0, bannerList.length - 1);
      _tabController.animateTo(index);
    }
  }

  Timer startTimeout(int seconds, BuildContext context) {
    var duration = new Duration(seconds: seconds);
    return Timer.periodic(duration, (Timer timer) {
      _handleArrow(context, 1);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: bannerList.length);
    timer = startTimeout(5, context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget bannerWidget = new Container(
      height: 220.0,
      child: new Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          new TabBarView(
            controller: _tabController,
            children: bannerList.map((Banner banner) {
              return BannerCardWidget(banner: banner);
            }).toList(),
          ),
          new Container(
            height: 28.0,
            alignment: Alignment.center,
            child: new TabPageSelector(
              controller: _tabController,
              indicatorSize: 10.0,
              color: Colors.blueGrey,
              selectedColor: Colors.white,
            ),
          ),
        ],
      ),
      color: Colors.blueGrey,
    );

    Widget menuTitleWidget = new Container(
      height: 48.0,
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Text(LinkedInLocalizations.of(context).jobCommand),
              ),
              new IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: new Icon(Icons.menu),
                onPressed: () {//TODO 筛选页面跳转
                },
                tooltip: LinkedInLocalizations.of(context).screen,
              )
            ],
          ),
          new Divider(color: Colors.grey[400], height: 0.0, indent: 0.0)
        ],
      ),
    );

    return new Container(
      child: new RefreshIndicator(
        child: new ListView(
          children: <Widget>[
            bannerWidget,
            menuTitleWidget,
            buildRow(context, 0),
          ],
        ),
        onRefresh: () {

        },
      ),
    );
  }

  Widget buildRow(BuildContext context, int index) {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Image.network('http://cruxcrush.com/wp-content/uploads/2015/12/nine.png', height: 50.0, width: 50.0, fit: BoxFit.cover),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('aaa', style: new TextStyle(color: Colors.black)),
                new Text('aaa', style: new TextStyle(color: Colors.black)),
                new Row(
                  children: <Widget>[
                    new Image.network('http://cruxcrush.com/wp-content/uploads/2015/12/nine.png', height: 20.0, width: 20.0, fit: BoxFit.cover),
                    new Text('aaa', style: new TextStyle(color: Colors.black))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Banner {
  const Banner({this.title, this.image});

  final String title;
  final String image;
}

class BannerCardWidget extends StatelessWidget {

  BannerCardWidget({this.banner});

  final Banner banner;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Image.network(banner.image),
        new Container(
          height: 38.0,
          alignment: Alignment.centerLeft,
          color: const Color(0x33444444),
          padding: const EdgeInsets.only(left: 10.0),
          child: new Text(
            banner.title,
            style: new TextStyle(
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}

class WorkExperienceWidget extends StatelessWidget {
  WorkExperienceWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(color: Colors.red);
  }
}
