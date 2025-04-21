import 'package:flutter/material.dart';
import 'package:myapp/config/theme/app_theme.dart';
import 'package:myapp/view/chat/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(indexColor: 1).theme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ChatScreen(),
    );
  }
}
