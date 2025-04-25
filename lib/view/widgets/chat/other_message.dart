import 'package:flutter/material.dart';

class OtherMessage extends StatelessWidget {
  const OtherMessage({super.key});

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
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "Otro: mensaje!!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 5),
        _BurbujaImagen(),
        SizedBox(height: 15),
      ],
    );
  }
}

class _BurbujaImagen extends StatelessWidget {
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
        "https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif",
        width: size.width * 0.7,
        height: 100,
        //fit: BoxFit.cover,
        fit: BoxFit.contain,
      ),
    );
  }
}
