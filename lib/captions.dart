// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  Movies({
    required this.kind,
    required this.etag,
    required this.items,
  });

  String kind;
  String etag;
  List<Item> items;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        kind: json["kind"],
        etag: json["etag"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toJson(),
      };
}

class Snippet {
  Snippet({
    required this.videoId,
    required this.lastUpdated,
    required this.trackKind,
    required this.language,
    required this.name,
    required this.audioTrackType,
    required this.isCc,
    required this.isLarge,
    required this.isEasyReader,
    required this.isDraft,
    required this.isAutoSynced,
    required this.status,
  });

  String videoId;
  DateTime lastUpdated;
  String trackKind;
  String language;
  String name;
  String audioTrackType;
  bool isCc;
  bool isLarge;
  bool isEasyReader;
  bool isDraft;
  bool isAutoSynced;
  String status;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        videoId: json["videoId"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        trackKind: json["trackKind"],
        language: json["language"],
        name: json["name"],
        audioTrackType: json["audioTrackType"],
        isCc: json["isCC"],
        isLarge: json["isLarge"],
        isEasyReader: json["isEasyReader"],
        isDraft: json["isDraft"],
        isAutoSynced: json["isAutoSynced"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "lastUpdated": lastUpdated.toIso8601String(),
        "trackKind": trackKind,
        "language": language,
        "name": name,
        "audioTrackType": audioTrackType,
        "isCC": isCc,
        "isLarge": isLarge,
        "isEasyReader": isEasyReader,
        "isDraft": isDraft,
        "isAutoSynced": isAutoSynced,
        "status": status,
      };
}
