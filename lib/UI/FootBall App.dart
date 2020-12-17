
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orangetesttechnique/UI/Games.dart';
import 'package:orangetesttechnique/UI/TEAMS.dart';

class FootBallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child:Text("Games")),
                Tab(child: Text("TEAMS")),
              ],
            ),
            title: Text('FootBall App'),
          ),
          body: TabBarView(
            children: [
             games(),
              teams(),
            ],
          ),
        ),
      ),
    );
  }
}