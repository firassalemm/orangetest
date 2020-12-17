
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Resourceg<T> {
  final String url;
  T Function(Response response) parse;

  Resourceg({this.url,this.parse});
}

class servicegame {

  Future<T> load<T>(Resourceg<T> resourceg) async {

    final response = await http.get(resourceg.url);
    if(response.statusCode == 200) {
      return resourceg.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }

}