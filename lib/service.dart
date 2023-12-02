import 'dart:io';
import 'package:http/http.dart';
import 'captions.dart';
import 'package:datemarker/constants.dart';
import 'package:http/http.dart' as http;

class Service {
  //final String link;
  //const Service({required this.link});
  static const _baseurl = 'youtube.googleapis.com';
  static const ID = 'feQhHStBVLE';

  /*
  curl \
  'https://youtube.googleapis.com/youtube/v3/captions?part=snippet%2Cid&videoId=ATElufr0OiE&access_token=AIzaSyDicGUHJm-nArXUJ4tOovwVzDJNJI_jSQE&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed
   */
  static Future<Movies> getCaptionInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,id',
      'id': ID,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseurl,
      '/youtube/v3/captions',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    Movies captionInfo = moviesFromJson(response.body);
    return captionInfo;
  }
}
