class Users {
  final String id;
  final String name;
  final String email;

  Users(this.id, this.name, this.email);

  Users.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"];
}
