import 'package:dio/dio.dart';
import 'package:myapp/model/message.dart';


import '../model/yes_no.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}

// flutter pub add dio

// final dio = Dio();

// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
// }