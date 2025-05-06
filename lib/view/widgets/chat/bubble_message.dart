import 'package:flutter/material.dart';
import 'package:myapp/model/message.dart';

class BubbleMessage extends StatelessWidget {
  final Message message;
  const BubbleMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: //const EdgeInsets.all(8.0),
                EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message.text, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
