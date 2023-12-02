class User {
  final int id;
  final int privacyLevel;
  final String username;
  final String authvalue;
  final String? session; // Nullable fields are marked with '?'
  final String? workouts;
  final String? history;

  User({
    required this.id,
    required this.privacyLevel,
    required this.username,
    required this.authvalue,
    this.session,
    this.workouts,
    this.history,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      privacyLevel: json['privacy_level'],
      username: json['username'],
      authvalue: json['authvalue'],
      session: json['session'],
      workouts: json['workouts'],
      history: json['history'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'privacy_level': privacyLevel,
      'username': username,
      'authvalue': authvalue,
      'session': session,
      'workouts': workouts,
      'history': history,
    };
  }
}
