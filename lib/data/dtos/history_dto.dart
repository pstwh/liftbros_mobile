class HistoryDto {
  final int userId;
  final String sessionToken;

  HistoryDto({
    required this.userId,
    required this.sessionToken,
  });

  factory HistoryDto.fromJson(Map<String, dynamic> json) {
    return HistoryDto(
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
