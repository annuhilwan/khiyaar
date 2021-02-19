import 'dart:convert';
import 'listaudio.dart';
import 'package:http/http.dart' as http;

class AudioViewModel {
  Future<List<Audio>> getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://www.khiyaar.com/audiokajian/json.php"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = audioFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}
