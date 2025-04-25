# chat_app

<!-- Suggested code may be subject to a license. Learn more: ~LicenseLog:3463883920. -->
<!-- Suggested code may be subject to a license. Learn more: ~LicenseLog:2517100940. -->

Se generará una aplicación que contenga un chat y cargue imágenes y texto dentro de la misma.

## Create first step

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Material App Bar')),
        body: Center(child: FilledButton.tonal(onPressed: () {}, 
        child: Text('Prueba'))),
      ),
    );
  }
}
```

## create lib/config/theme/app_theme.dart

Se genera una clase para configurar el tema de la app

```dart
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData();
  }
}

```

* Agregar el archivo a la carpeta lib/config/theme/

* Enseguida, agregar este archivo main.dart dentro de la definición del `theme: ` donde se hace referencia a la nueva clase.

* Invocar esta clase llamando al método `theme()`.

* notar que se debe agregar automáticamente o usando `Control + .` la agregación de la referencia al archivo `import 'package:myapp/config/theme/app_theme.dart';
`

Deberá verse la siguiente app:

<img src='images/chat_app01.png' alt='chat_app01' width='40%'>


## funcionalidad de cambio de tema

Agregar los cambios que consideren

```dart
import 'package:flutter/material.dart';

class AppTheme {
  //variable privada inicia con _
  final Color _customColor = Color(0xFF49149f);

  final List<Color> _colorThemes = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.teal,
  ];
  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorThemes[1]);
  }
}

```

### Uso de un ínidic
```dart
import 'package:flutter/material.dart';

class AppTheme {
  final int indexColor;

  final List<Color> _colorThemes = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.teal,
  ];

  AppTheme({this.indexColor = 0}) {
    assert(
      indexColor >= 0 && indexColor <= _colorThemes.length - 1,
      'El indice debe estar entre 0 y ${_colorThemes.length - 1}',
    );
  }

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[indexColor],
    );
  }
}

```

La aserción puede probarse al llamar desde el main

```dart
theme: AppTheme(indexColor: -1).theme() ,
```


```dart
theme: AppTheme(indexColor: 11).theme() ,
```

<img src='images/chat_app02.png' alt='chat_app01' width='90%'>




<!-- Suggested code may be subject to a license. Learn more: ~LicenseLog:1362790887. -->
## Creación de la clase ChatScreen
Los comentarios muestran los snippets para crear el archivo en la carpeta lib/view/chat/chat_screen.dart

```dart
//impm
import 'package:flutter/material.dart';

//stleswi

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```
## Modificación para una pantalla básica para la app

Modificación de la pantalla de presentación
```dart
//impm
import 'package:flutter/material.dart';

//stleswi

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat de ejemplo"),
        centerTitle: false,
        leading: CircleAvatar(),
      ),
    );
  }
}

```

### Invocación desde el main

```dart
return MaterialApp(
      theme: AppTheme(indexColor: 5).theme() ,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ChatScreen(), // borrar Scaffold
    );
```
<img src='images/chat_app03.png' alt='chat_app03' width='30%'>


## Agregar imagen del avatar

Modificar el archivo `pubspec.yaml` en la raiz del proyecto.
Crear la carpeta indicada y poner las imágenes o imagen que se desee usar en la aplicación.

```yml
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/avatars/
```


```dart
//impm
import 'package:flutter/material.dart';

//stleswi

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat de ejemplo"),
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: // NetworkImage("https://img.itch.zone/aW1hZ2UvMTk0MTE3NC8xMTQxMjU5Mi5qcGc=/original/js5a6b.jpg")
            AssetImage("assets/avatars/cat2.jpg"),
            //AssetImage('assets/avatars/cat01.webp'),
          ),
        ),
      ),
    );
  }
}

```
* Se puede usar una imagen extraida de la red como se muestra en el comentario `NetworkImage("https://img.itch.zone/aW1hZ2UvMTk0MTE3NC8xMTQxMjU5Mi5qcGc=/original/js5a6b.jpg")`

* Probar ambas opciones.


<img src='images/chat_app04.png' alt='chat_app04' width='30%'>

## Creación del contenedor para el cuerpo de la app

```dart
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... agregar el body (dejar el resto)
      body: _ChatView(),  //Column() --> (control + . ) extract Widget
    );
  }
}

// se genera esta clase
class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
} 

```


```dart

class _ChatView extends StatelessWidget {
  const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text('Prueba 01'), Text('Prueba 02')]);
  }
}


```

```dart
class _ChatView extends StatelessWidget {
  const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: Container(color: Colors.amber)),
          Text('Prueba 01'),
          Text('Prueba 02'),
        ],
      ),
    );
  }
}
```
<img src='images/chat_app05.png' alt='chat_app05' width='40%'>


```dart
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
            Text('Prueba 03'),
            
          ],
        ),
      ),
    );
  }
}

```
<img src='images/chat_app06.png' alt='chat_app06' width='40%'>



# Mosdificación del chat para tener un widget por cada mensaje.
Crear el archivo `lib/view/widgets/chat/bubble_message.dart`

Crearlo usando:
1. Crear un Widget de tipo Text / el return del `StatelessWidget`  será solo el Text.
2. Envolverlo con un Padding 
3. Envolverlo con un Container


```dart
import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Text("Mensaje: hola pruebita!!", 
                  style: TextStyle(color: Colors.blue) 
    );
  }
}
```
Llegar hasta este punto

```dart
import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors =  Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary, //toma el color del tema
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:  //const EdgeInsets.all(8.0),
            EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
            child: Text("Mensaje: hola pruebita!!", 
                  style: TextStyle(color: Colors.blue),),
          ),
        ),
        SizedBox(height: 10, width: 10,)
      ],
    );
  }
}

```
# Bubble Message

```dart
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

```


# Mensajes de la otra persona

```dart
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
      ],
    );
  }
}

class _BurbujaImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

```

# Modificar chat_screen.dart

```dart
Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  //return BubbleMessage();
                  //return OtherMessage();
                  return index % 2 == 0
                      ? const OtherMessage()
                      : const BubbleMessage();
                },
              ),
            )
```


# Probar con el API

```bash
curl https://yesno.wtf/api 
```
Genera una respuesta como:
```json
{
  "answer": "no",
  "forced": false,
  "image": "https://yesno.wtf/assets/no/25-55dc62642f92cf4110659b3c80e0d7ec.gif"
}
```

```json
{
  "answer": "yes",
  "forced": false,
  "image": "https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif"
}
```



## Ajustes temporales a Burbuja

```dart

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

```














## Crear un zip del proyecto
```bash
  zip -r chat-project.zip  lib/ pubspec.yaml README.md  assets/ images/
```


