class RegisterModel {
  String userId;
  String name;
  String email;
  String password;

  RegisterModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toMap() {
    return {
      'userId' : userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> jason) {
    return RegisterModel(
      userId: jason['userId'] as String,
      name: jason["name"] as String,
      email: jason["email"] as String,
      password: jason["password"] as String,
    );
  }
}
