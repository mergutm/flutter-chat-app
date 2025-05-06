import 'package:flutter/material.dart';
import 'package:myapp/model/message.dart';

class OtherMessage extends StatelessWidget {
  final Message message;
  const OtherMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: //const EdgeInsets.all(8.0),
                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 5),
        // _BurbujaImagen(message.imageUrl != null ? message.imageUrl! : ""),
        _BurbujaImagen(message.imageUrl!),

        SizedBox(height: 15),
      ],
    );
  }
}

class _BurbujaImagen extends StatelessWidget {
  final String imageUrl;
  // ="https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif";
  //const _BurbujaImagen({super.key, required this.imageUrl});
  const _BurbujaImagen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    //obtnener dimensiones del dispositivo
    final size = MediaQuery.of(context).size;
    // para ver la salida en consola.
    // print(size);
    // return Placeholder();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        //"https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif",
        imageUrl,
        width: size.width * 0.5,
        height: 100,
        fit: BoxFit.cover,
        //fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Recibiendo una imagen ...'),
          );
        },
      ),
    );
  }
}
