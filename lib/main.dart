import 'package:flutter/material.dart';
import 'package:hackatec/providers/chat_provider.dart';
import 'package:hackatec/routes/router.dart';
import 'package:hackatec/services/auth_service.dart';
import 'package:hackatec/services/socket_provider.dart';
import 'package:provider/provider.dart';

import 'services/maps_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        initialRoute: 'home',
        routes: appRoutes,
      ),
    );
  }
}
