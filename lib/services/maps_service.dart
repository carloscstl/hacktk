import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MapProvider extends ChangeNotifier {
  double lat = 0, long = 0;
  bool hasCoords = false;

  void setCoords(double lat, double long) {
    this.lat = lat;
    this.long = long;
    hasCoords = true;
  }

  void clearCoords() {
    lat = 0;
    long = 0;
    hasCoords = false;
  }

  List<String> getCoords() {
    return [lat.toString(), long.toString()];
  }
}
