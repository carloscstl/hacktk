import 'package:flutter/material.dart';
import 'package:hackatec/screens/courses_screen.dart';

import '../screens/craftsman_screen.dart';
import '../screens/instalaciones.dart';
import '../screens/register_artesanos.dart';
import '../screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (context) => HomeScreen(),
  'loading': (context) => const LoadingScreen(),
  'login': (context) => const LoginScreen(),
  'register': (context) => const RegisterScreen(),
  'chat-detail': (context) => const ChatDetailPage(),
  'registerCraftsman': (context) => const RegisterCraftsman(),
  'craftsmen': (context) => CraftsmanScreen(),
  'courses': (context) => const CoursesScreen(),
  'install': (context) => InstallScreen(),
};
