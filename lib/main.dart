import 'package:chat_app/ui/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final kdefaultTheme = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Online',
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? kIOSTheme
          : kdefaultTheme,
      home: ChatScreen(),
    );
  }
}
