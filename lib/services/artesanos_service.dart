import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../env.dart';
import '../models/models.dart';

class ArtesanoService extends ChangeNotifier {
  final baseUrl = Env.baseUrl;
  final storage = const FlutterSecureStorage();
  late User user;

  Future login(String username, String password) async {
    Future<String?> tkn = storage.read(key: 'accessToken');
    print(tkn);
    final data = {'userName': username, 'password': password};
    final res = await http.post(Uri.parse('$baseUrl/api/auth/login'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'HttpHeaders.authorizationHeader': 'Bearer $tkn'
        });
    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes.containsKey('user')) {
      await storage.write(key: 'userId', value: decodedRes['user']['_id']);
    }

    if (decodedRes.containsKey('accessToken')) {
      await storage.write(key: 'token', value: decodedRes['accessToken']);
      user = User.fromMap(decodedRes['user']);
    }
    print(decodedRes);
  }

  Future register(
      String name, String lastName, String gender, List<String> coords) async {
    String? tkn = await storage.read(key: 'token');
    print(tkn);

    final data = {
      "name": name,
      "lastName": lastName,
      "admissionDate": "03/10/2021",
      "gender": gender,
      "geoLocalization": coords
    };
    final res = await http.post(Uri.parse('$baseUrl/api/craftsman'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tkn'
        });
    final Map<String, dynamic> decodedRes = json.decode(res.body);

    print(decodedRes);
  }
}
