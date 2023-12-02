import 'package:dio/dio.dart';
import 'package:liftbros_mobile/entities/user.dart';

class ApiProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000/'));

  Future<User> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        'login',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to login');
      }
    } on DioError catch (e) {
      print(e);
      throw Exception('Failed to login');
    }
  }
}
