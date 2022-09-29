import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import 'instalaciones_body.dart';

class InstallScreen extends StatefulWidget {
  @override
  State<InstallScreen> createState() => _InstallScreenState();
}

class _InstallScreenState extends State<InstallScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late BuildContext _context;
  bool menu = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appbarHeight = 70;

    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {}, //Functions.createReport(context),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_to_queue),
      ),
      appBar: AppBar(
        backgroundColor: mainColor,
        shape: Border(bottom: BorderSide(color: mainColor, width: 4)),
        elevation: 0,
      ),
      body: HomeScreenBody(),
    );
  }
}
