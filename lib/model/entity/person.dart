class Person{
  int? id;
  String? role;
  String? first_name;
  String? last_name;
  String? code_meli;
  String? phone_number;
  String? email;
  String? home_number;
  String? image;

  Person({
    this.id,
    required this.phone_number,
    this.first_name,
    this.last_name,
    this.code_meli,
    this.email,
    this.home_number,
    this.image,
    this.role,
  });
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"],
      phone_number: json["username"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      code_meli: json["national_code"],
      email: json["email"],
      home_number: json["home"],
      image : json["image"],
      role: json["role"],
    );
  }
  Map<String, dynamic> toJson()=> {
    'id' : id,
    'username':phone_number,
    'first_name' : first_name,
    'last_name' : last_name,
    'national_code': code_meli,
    'email' : email,
    'home_number':home_number,
    'image' : image,
    'role' : role,
  };
}