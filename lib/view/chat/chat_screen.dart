//impm
import 'package:flutter/material.dart';

//stleswi

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat de ejemplo"),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: // NetworkImage("https://img.itch.zone/aW1hZ2UvMTk0MTE3NC8xMTQxMjU5Mi5qcGc=/original/js5a6b.jpg")
            //AssetImage("assets/avatars/cat2.jpg"),
            AssetImage('assets/avatars/cat01.webp'),
          ),
        ),
      ),
      body: _ChatView(), //Column() --> (control + . ) extract Widget
    );
  }
}

class _ChatView extends StatelessWidget {
  //const _ChatView({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        //padding: const EdgeInsets.all(8.0),
        //padding: EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            //Expanded(child: Container(color: Colors.amber)),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Text('Prueba $index');
                },
              ),
            ),
            
            Text('Prueba 01'),
            Text('Prueba 02'),
          ],
        ),
      ),
    );
  }
}
