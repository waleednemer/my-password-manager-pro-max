class PasswordEntry {
  final int? id;
  final String website;
  final String username;
  final String password;
  final String notes;

  PasswordEntry({
    this.id,
    required this.website,
    required this.username,
    required this.password,
    this.notes = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'website': website,
      'username': username,
      'password': password,
      'notes': notes,
    };

  }

  static PasswordEntry fromMap(Map<String, dynamic> map) {
    return PasswordEntry(
      id: map['id'],
      website: map['website'],
      username: map['username'],
      password: map['password'],
      notes: map['notes'],
    );
  }
}
