import 'dart:io';

import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key=231dfba16c3d3c301e9f4ee214c2fab1';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<String?> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming$urlKey$urlLanguage';
    final Uri uri = Uri.parse(upcoming);

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      String responseBody = response.body;
      return responseBody;
    } else {
      return null;
    }
  }
}
