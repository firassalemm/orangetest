

import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:orangetesttechnique/entities/game.dart';
import 'package:orangetesttechnique/entities/team.dart';
import 'package:orangetesttechnique/services/gameservice.dart';
import 'package:orangetesttechnique/services/teamservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Games extends State<games> {

  List<game> _game = List<game>();
 // List<team> _teamhome = List<team>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    _populateNewsgame();

  }

  void _populateNewsgame() {

    servicegame().load(game.all).then((user) => {
      setState(() => {
        _game = user

      })
    });


  }

  ListTile _buildItemsForListView(BuildContext context, int index) {

    return ListTile(
      contentPadding:EdgeInsets.fromLTRB(10, 0, 0, 0) ,
     // title:  Text(_game[index].visitor_team_score.toString()+"("+_game[index].home_team_score.toString()+")", style: TextStyle(fontSize: 18)),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(_game[index].date.substring(0, 10)),
          ),
          //SizedBox(height: 50),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
             crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Text(_game[index].home_team),
                    Text(_game[index].home_teamab),
                  ],
                ),
                RaisedButton(
                  child: Text(_game[index].home_team_score.toString() +"-"+_game[index].visitor_team_score.toString(), style: TextStyle(fontSize: 20)),
                ),
                Column(
                 //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_game[index].visitor_team),
                    Text(_game[index].visitor_teamab)
                  ],
                ),
              ],
            ),
          ),
Container(
  child: Text(_game[index].status.substring(0,5)),
)
        ],
      ),
        onTap: () {
          SimpleAlertBoxCenter(buttonText: "good",buttonColor: Colors.redAccent,buttonTextColor: Colors.white,infoMessage:(_game[index].home_team+" -VS -"+_game[index].visitor_team) ,context: context);

        }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
          itemCount: _game.length,
          itemBuilder: _buildItemsForListView,
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),

        )
    );

  }



}

class games extends StatefulWidget {

  @override
  createState() => Games();
}