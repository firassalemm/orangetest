
import 'dart:convert';

import 'package:orangetesttechnique/entities/team.dart';
import 'package:orangetesttechnique/services/gameservice.dart';


class game {

  final int id;
  final String date;
  final String home_team;
  final String home_teamab;
  final int home_team_score;
  final int period;
  final bool postseason;
  final int season;
  final String status;
  final String time;
  final String visitor_team;
  final String visitor_teamab;
  final int visitor_team_score;
  game({this.id, this.date,this.home_team,this.home_teamab,this.home_team_score,this.period,this.postseason,this.season,this.status,this.time,this.visitor_team,this.visitor_teamab,this.visitor_team_score});

  factory game.fromJson(Map<String,dynamic> json) {
    return game(
      id: json['id'],
      date: json['date'],
      home_team: json['home_team']["full_name"],
      home_teamab:json['home_team']["abbreviation"],
      home_team_score: json['home_team_score'],
      period: json['period'],
      postseason: json['postseason'],
      season: json['season'],
      status: json['status'],
      time: json['time'],
      visitor_team: json['visitor_team']["full_name"],
      visitor_teamab :json['visitor_team']["abbreviation"],
      visitor_team_score: json['visitor_team_score'],
    );
  }

  static Resourceg<List<game>> get all {

    return Resourceg(
        url: "https://api.mocki.io/v1/722624a5/games",
        parse: (response) {
          dynamic  result = json.decode(response.body);
          Iterable list = result["data"];
          return list.map((model) => game.fromJson(model)).toList();

        }
    );

  }
/*  static Resourceg<List<team>> get hometeam {

    return Resourceg(
        url: "https://api.mocki.io/v1/722624a5/games",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result["data"]["home_team"];
          // Map<String, dynamic> map = json.decode(response.body);
          // List<dynamic> data = map["data"];
          // print(data[0]["name"]);
          return list.map((model) => team.fromJson(model)).toList();

        }
    );*/

  }

