import 'package:dio/dio.dart';

import 'package:get_data/app/service/domain/info.dart';
import 'package:get_data/app/service/domain/service_response.dart';

class Auth {
  Dio dio = Dio();
  ServiceResponse m = ServiceResponse();
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  Future<ServiceResponse> getData() async {
    var _response;
    try {
      _response = await dio.get(_baseUrl);
    } on DioError catch (e) {
      print(e);
      return ServiceResponse(
        status: false,
        message: e.error.toString(),
      );
    }
    print(_response);
    print(m.data);
    return ServiceResponse(
      status: true,
      message: "worked",
      data: Info.fromJson(_response),
    );
  }
}
