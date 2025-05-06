import 'package:flutter/material.dart';
import 'package:myapp/helper/answer_dio.dart';
import 'package:myapp/model/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola pruebita!', fromWho: FromWho.me),
    Message(
      text: 'WOW!',
      fromWho: FromWho.other,
      imageUrl:
          "https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif",
    ),
    Message(text: 'Cómo va el dia?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // si el mensaje está vacio
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await otherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
