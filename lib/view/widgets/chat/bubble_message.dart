import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({super.key});

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
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Mensaje: hola pruebita!!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
