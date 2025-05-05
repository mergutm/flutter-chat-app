import 'package:flutter/material.dart';
import 'package:myapp/view/widgets/providers/chat_provider.dart';
import  'package:provider/provider.dart';
import 'package:myapp/config/theme/app_theme.dart';
import 'package:myapp/view/chat/chat_screen.dart';

// TODO add pacjage chatprovider

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(      
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider() )
      ],
      child:      MaterialApp(
      theme: AppTheme(indexColor: 1).theme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ChatScreen(),
      //home: RecipeBook(),
    ));
  }
}
