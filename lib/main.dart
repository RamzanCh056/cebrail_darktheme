

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/change_notifier.dart';
import 'auth/login_page.dart';
import 'theme/theme_data.dart';
void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      child: HomeApp(),
    ),
  );
}

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Flutter Theming Tutorials',
          debugShowCheckedModeBanner: false,
          theme: ThemeClass.lightTheme, // ThemeData(primarySwatch: Colors.blue),
          darkTheme: ThemeClass.darkTheme, // ThemeData(primarySwatch: Colors.blue),
          home: Login_Page(),
          themeMode: appState.isDarkMode? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
