import 'package:dio/dio.dart';
import 'package:test/main.dart';

void getRequest() async {
  try {
    var response = await Dio().get('https://www.foaas.com/operations');
    for (var i in response.data) {
      String name = i["name"];
      data.add(name);
    }
  } catch (e) {
    print(e);
  }
}
