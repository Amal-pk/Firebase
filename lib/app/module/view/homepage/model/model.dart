class Details {
  String? name;
  String? phonenumber;
  String? age;
  String? email;
  String? id;
  Details({
    this.age,
    this.email,
    this.phonenumber,
    this.name,
    this.id,
  });
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
        name: json['name'],
        age: json['age'],
        phonenumber: json['phonenumber'],
        id: json['id'],
        email: json['email']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'phonenumber': phonenumber,
        'id': id,
        'email': email,
      };
}
