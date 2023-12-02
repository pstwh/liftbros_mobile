class UserDto {
  final int id;
  final int privacyLevel;
  final String username;

  UserDto({
    required this.id,
    required this.privacyLevel,
    required this.username,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      username: json['username'],
      privacyLevel: json['privacy_level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'privacyLevel': privacyLevel,
    };
  }
}
