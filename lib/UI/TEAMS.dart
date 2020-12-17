
import 'package:flutter/material.dart';
import 'package:orangetesttechnique/entities/team.dart';
import 'package:orangetesttechnique/services/teamservice.dart';

class Teams extends State<teams> {

  List<team> _team = List<team>();

  @override
  void initState() {
    super.initState();
    _populateNewsteam();
  }

  void _populateNewsteam() {

    serviceteam().load(team.all).then((user) => {
      setState(() => {
        _team = user
      })
    });

  }

  ListTile _buildItemsForListView(BuildContext context, int index) {

    return ListTile(
     // contentPadding:EdgeInsets.fromLTRB(10, 0, 0, 0) ,
      title:  Text(_team[index].full_name.toString()+"("+_team[index].abbreviation+")", style: TextStyle(fontSize: 18)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("city:"+_team[index].full_name), Text("division:"+_team[index].division)],
            ),
          ),
          Container(
            //margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [Text("name:"+_team[index].name), Text("conference:"+_team[index].conference)],
            ),
          )
        ],
      ),

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: _team.length,
          itemBuilder: _buildItemsForListView,
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),

        )
    );
  }

}

class teams extends StatefulWidget {

  @override
  createState() => Teams();
}