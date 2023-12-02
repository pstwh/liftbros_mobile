class LoginDto {
  final int userId;
  final String sessionToken;

  LoginDto({
    required this.userId,
    required this.sessionToken,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      userId: json['user_id'],
      sessionToken: json['session_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'session_token': sessionToken,
    };
  }
}
