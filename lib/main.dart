import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'linkedin_localizations.dart';
import 'tab_one.dart';
import 'tab_two.dart';
import 'tab_three.dart';
import 'tab_four.dart';
import 'tab_five.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          LinkedInLocalizations.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyTabHomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        LinkedInLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('zh', ''),
      ],
    );
  }
}

class MyTabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => new _TabHomePageState();
}

class _TabHomePageState extends State<MyTabHomePage> {
  static const int TAB_ONE = 0; //首页
  static const int TAB_TWO = 1; //职业
  static const int TAB_THREE = 2; //人脉
  static const int TAB_FOUR = 3; //消息
  static const int TAB_FIVE = 4; //我

  static const Color _bottomNavBarItemBackgroundColor = const Color(0xFFBFBFBF);

  int currentIndex = 0;

  List<BottomNavigationBarItem> getBottomNavBarItemList(BuildContext context) {
    return [
      new BottomNavigationBarItem(
          icon: Image.asset('images/home.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations.of(context).home),
          activeIcon:
              Image.asset('images/home_clicked.png', width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/profession.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations.of(context).profession),
          activeIcon: Image.asset('images/profession_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/connection.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations.of(context).connection),
          activeIcon: Image.asset('images/connection_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/message.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations.of(context).message),
          activeIcon: Image.asset('images/message_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/my.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations.of(context).my),
          activeIcon:
              Image.asset('images/my_clicked.png', width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor)
    ];
  }

  void onTabNavBarTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = new Stack(
      children: <Widget>[
        new Offstage(
          offstage: currentIndex != TAB_ONE,
          child: new TabOneWidget(),
        ),
        new Offstage(
          offstage: currentIndex != TAB_TWO,
          child: new TabTwoWidget(),
        ),
        new Offstage(
          offstage: currentIndex != TAB_THREE,
          child: TabThreeWidget(),
        ),
        new Offstage(
          offstage: currentIndex != TAB_FOUR,
          child: TabFourWidget(),
        ),
        new Offstage(
          offstage: currentIndex != TAB_FIVE,
          child: TabFiveWidget(),
        )
      ],
    );
    List<BottomNavigationBarItem> items = getBottomNavBarItemList(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LinkedInLocalizations.of(context).homeTitle),
        leading: new Icon(Icons.search),
      ),
      body: bodyWidget,
      bottomNavigationBar: new BottomNavigationBar(
        items: items,
        type: BottomNavigationBarType.fixed,
        onTap: onTabNavBarTap,
        currentIndex: currentIndex,
      ),
    );
  }
}
