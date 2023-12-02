import 'package:dio/dio.dart';
import 'package:liftbros_mobile/data/dtos/login_dto.dart';
import 'package:liftbros_mobile/data/dtos/user_dto.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://2213-179-211-51-13.ngrok-free.app/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<LoginDto> login(String username, String password) async {
    Response response = await _dio.post(
      'user/login',
      data: {'username': username, 'password': password},
    );

    print(response.toString());

    if (response.statusCode == 200) {
      return LoginDto.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserDto> user(int userId) async {
    Response response = await _dio.get('user/$userId');

    if (response.statusCode == 200) {
      return UserDto.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
