import 'package:flutter/material.dart';

class TabFourWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabFourWidgetState();
  }
}

class TabFourWidgetState extends State<TabFourWidget>
    with SingleTickerProviderStateMixin {
  TabController mTabController;

  @override
  void initState() {
    super.initState();
    mTabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final Color primaryColor = Theme.of(context).primaryColor;

    List<TabChoose> tabs = tabChooseList(context);

    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: new Container(
          padding: new EdgeInsets.only(top: statusBarHeight),
          color: primaryColor,
          child: new TabBar(
            controller: mTabController,
            tabs: tabs.map((TabChoose tab) {
              return tab.title;
            }).toList(),
          ),
        ),
      ),
      body: new TabBarView(
        controller: mTabController,
        children: tabs.map((TabChoose tab) {
          return tab.child;
        }).toList(),
      ),
    );
  }
}

class TabChoose {
  TabChoose({this.title, this.child});

  final Widget title;
  final Widget child;
}

List<TabChoose> tabChooseList(BuildContext context) {
  return <TabChoose> [
    TabChoose(
        title: new SizedBox.expand(
          child: new Center(
            child: new Text('通知', style: new TextStyle(fontSize: 18.0)),
          ),
        ),
        child: new NotifyWidget()
    ),
    TabChoose(
        title: new SizedBox.expand(
          child: new Center(
            child: new Text('私信', style: new TextStyle(fontSize: 18.0)),
          ),
        ),
        child: new PrivateMessageWidget()
    ),
  ];
}

class NotifyWidget extends StatelessWidget {

  NotifyWidget();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.grey[200],
    );
  }
}

class PrivateMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.grey[400],
    );
  }
}
