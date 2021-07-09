import 'package:flutter/material.dart';

import 'pages/callscreen.dart';
import 'pages/camerascreen.dart';
import 'pages/chatscreen.dart';
import 'pages/statusscreen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = new TabController(vsync: this, initialIndex: 1, length: 4,);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),new Icon(Icons.more_vert),
        ],
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new Camerascreen(),
          new Chatscreen(),
          new Statusscreen(),
          new Callscreen(),

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
          child: new Icon(Icons.message,
            color: Colors.white,
          ),
          onPressed: ()=> print("Open Chats"),
      ),
    );
  }

}
