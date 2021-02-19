// To parse this JSON data, do
//
//     final audio = audioFromJson(jsonString);

import 'dart:convert';

List<Audio> audioFromJson(String str) =>
    List<Audio>.from(json.decode(str).map((x) => Audio.fromJson(x)));

String audioToJson(List<Audio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Audio {
  Audio({
    this.idaudio,
    this.judul,
    this.ustadz,
    this.linkAudio,
    this.linkGambar,
  });

  String idaudio;
  String judul;
  String ustadz;
  String linkAudio;
  String linkGambar;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        idaudio: json["idaudio"],
        judul: json["judul"],
        ustadz: json["ustadz"],
        linkAudio: json["link_audio"],
        linkGambar: json["link_gambar"],
      );

  Map<String, dynamic> toJson() => {
        "idaudio": idaudio,
        "judul": judul,
        "ustadz": ustadz,
        "link_audio": linkAudio,
        "link_gambar": linkGambar,
      };
}
