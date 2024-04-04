import 'package:flutter/material.dart';
import 'Screens/splash.dart';
import 'Screens/login.dart';
import 'Screens/home.dart';
import 'Screens/profile.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
