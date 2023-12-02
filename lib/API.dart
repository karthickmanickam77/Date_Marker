import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getdata(String url) async {
  final uri = Uri.parse(url);
  print(uri);
  final response = await http.get(uri);
  print(response);
  if (response.statusCode == 200) {
    // The request was successful, parse the response body
    final script = json.decode(response.body);
    print(script);
    return script;
  } else {
    // The request failed with a non-200 status code
    throw Exception('Request failed with status: ${response.statusCode}');
  }
}
