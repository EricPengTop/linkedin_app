import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'linkedin_localizations.dart';
import 'tab_five.dart';
import 'tab_four.dart';
import 'tab_one.dart';
import 'tab_three.dart';
import 'tab_two.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  static const MaterialColor swatchColor = const MaterialColor(
    _bluePrimaryValue,
    const <int, Color>{
      50: const Color(0xFFE3F2FD),
      100: const Color(0xFFBBDEFB),
      200: const Color(0xFF90CAF9),
      300: const Color(0xFF64B5F6),
      400: const Color(0xFF42A5F5),
      500: const Color(_bluePrimaryValue),
      600: const Color(0xFF1E88E5),
      700: const Color(0xFF1976D2),
      800: const Color(0xFF1565C0),
      900: const Color(0xFF0D47A1),
    },
  );
  static const int _bluePrimaryValue = 0xFF0084BF;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) =>
      LinkedInLocalizations
          .of(context)
          .title,
      theme: new ThemeData(
        primarySwatch: swatchColor,
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

  int currentIndex = 0; //当前页面下标
  bool showAction = false; //是否显示appbar动作按钮
  bool showAppBar = true; //默认显示appbar
  String searchTitle = ""; //搜索标题默认为空

  TextStyle bottomNavBarItemTextStyle = new TextStyle(
      fontSize: 16.0
  );

  List<BottomNavigationBarItem> getBottomNavBarItemList(BuildContext context) {
    return [
      new BottomNavigationBarItem(
          icon: Image.asset('images/home.png', width: 25.0, height: 25.0),
          title: new Text(
            LinkedInLocalizations
                .of(context)
                .home,
            style: bottomNavBarItemTextStyle,
          ),
          activeIcon:
          Image.asset('images/home_clicked.png', width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/profession.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations
              .of(context)
              .profession,
            style: bottomNavBarItemTextStyle,),
          activeIcon: Image.asset('images/profession_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/connection.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations
              .of(context)
              .connection, style: bottomNavBarItemTextStyle,),
          activeIcon: Image.asset('images/connection_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/message.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations
              .of(context)
              .message, style: bottomNavBarItemTextStyle,),
          activeIcon: Image.asset('images/message_clicked.png',
              width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor),
      new BottomNavigationBarItem(
          icon: Image.asset('images/my.png', width: 25.0, height: 25.0),
          title: new Text(LinkedInLocalizations
              .of(context)
              .my, style: bottomNavBarItemTextStyle,),
          activeIcon:
          Image.asset('images/my_clicked.png', width: 25.0, height: 25.0),
          backgroundColor: _bottomNavBarItemBackgroundColor)
    ];
  }

  void onTabNavBarTap(int index, BuildContext context) {
    setState(() {
      this.currentIndex = index;
    });
    switch (this.currentIndex) {
      case TAB_ONE:
        setState(() {
          this.searchTitle = LinkedInLocalizations
              .of(context)
              .homeTitle;
          this.showAppBar = true;
          this.showAction = false;
        });
        break;
      case TAB_TWO:
        setState(() {
          this.searchTitle = LinkedInLocalizations
              .of(context)
              .professionTitle;
          this.showAppBar = true;
          this.showAction = false;
        });
        break;
      case TAB_THREE:
        setState(() {
          this.searchTitle = LinkedInLocalizations
              .of(context)
              .connectionTitle;
          this.showAction = true;
          this.showAppBar = true;
        });
        break;
      default:
        setState(() {
          this.showAction = false;
          this.searchTitle = "";
          this.showAppBar = false;
        });
        break;
    }
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

    Widget appBar = new AppBar(
      title: new Text(
        searchTitle.length > 0 ? searchTitle : LinkedInLocalizations
            .of(context)
            .homeTitle,
        style: new TextStyle(
            fontSize: 16.0
        ),
      ),
      titleSpacing: 0.0,
      leading: new Icon(Icons.search),
      actions: <Widget>[
        showAction ? new IconButton(
            icon: Image.asset('images/contact_people.png', width: 25.0, height: 25.0,),
            onPressed: null
        ) : new Text('')
      ],
      elevation: 1.0,//底部投影
    );

    return new Scaffold(
      appBar: showAppBar ? appBar : null,
      body: bodyWidget,
      bottomNavigationBar: new BottomNavigationBar(
        items: items,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => onTabNavBarTap(index, context),
        currentIndex: currentIndex,
        iconSize: 30.0,
      ),
    );
  }
}