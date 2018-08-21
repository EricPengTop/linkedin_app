import 'package:flutter/material.dart';

class TabTwoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabTwoWidgetState();
  }
}

class _TabTwoWidgetState extends State<TabTwoWidget> with SingleTickerProviderStateMixin {
  
  static const List<Widget> tabs = [const ChoiceCard(), const ChoiceCard()]; //tab个数
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {

    TextStyle defaultStyle = new TextStyle(
      color: Colors.black87
    );
    TextStyle selectedStye = new TextStyle(
      color: const Color(0x0084BF)
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton(
                    onPressed: null,
                    child: new Text('职位发现',
                        style: defaultStyle))),
            new Expanded(
                child: new FlatButton(
                    onPressed: null,
                    child: new Text('工作体会',
                        style: defaultStyle)))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs,
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('a');
  }
}
