class UserDetails {
  final int? id;

  final String name, surname, email, password;
  final int phoneNumber;

  UserDetails({
    this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  static UserDetails fromJson(Map<String, Object?> json) => UserDetails(
      id: json["_id"] as int?,
      name: json["name"] as String,
      surname: json["surname"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      phoneNumber: json["phoneNumber"] as int);

  Map<String, Object?> toJson() => {
        "_id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
