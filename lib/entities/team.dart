
import 'dart:convert';

import 'package:orangetesttechnique/services/teamservice.dart';


class team {

  final int id;
  final String abbreviation;
  final String city;
  final String conference;
  final String division;
  final String full_name;
  final String name;
  team({this.id, this.abbreviation, this.city,this.conference,this.division,this.full_name,this.name});

  factory team.fromJson(Map<String,dynamic> json) {
    return team(
        id: json['id'],
        abbreviation: json['abbreviation'],
        city: json['city'],
        conference: json['conference'],
        division: json['division'],
        full_name: json['full_name'],
        name: json['name'],
    );

  }

  static Resource<List<team>> get all {

    return Resource(
        url: "https://api.mocki.io/v1/722624a5/teams",
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result["data"];
          return list.map((model) => team.fromJson(model)).toList();
        }
    );

  }

}