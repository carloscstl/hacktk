import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../env.dart';
import '../models/models.dart';

class AuthService extends ChangeNotifier {
  final baseUrl = Env.baseUrl;
  final storage = const FlutterSecureStorage();
  late User user;

  Future login(String username, String password) async {
    final data = {'userName': username, 'password': password};
    final res = await http.post(Uri.parse('$baseUrl/api/auth/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes.containsKey('user')) {
      await storage.write(key: 'userId', value: decodedRes['user']['_id']);
    }

    if (decodedRes.containsKey('accessToken')) {
      await storage.write(key: 'token', value: decodedRes['accessToken']);
      user = User.fromMap(decodedRes['user']);
    }

    if (decodedRes['status'] != null) {
      return true;
    }
    return false;
  }

  Future register(String username, String password, String fullName) async {
    final data = {
      'userName': username,
      'password': password,
      "fullName": fullName
    };
    final res = await http.post(Uri.parse('$baseUrl/api/auth/register'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes['status'] != null) {
      return true;
    }
    return false;
  }

  Future<bool> verifyToken() async {
    final token = await storage.read(key: 'token') ?? 'tokennovalidomen';
    final resp = await http.get(Uri.parse('$baseUrl/api/auth/renew'),
        headers: {'Authorization': 'Bearer $token'});

    final Map<String, dynamic> decodedRes = json.decode(resp.body);

    if (decodedRes['status'] == true) {
      user = User.fromMap(decodedRes['user']);
    }
    if (decodedRes['status'] != null) {
      return true;
    }
    return false;
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'userId');
    return;
  }

  static Future<String> getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token!;
  }
}
