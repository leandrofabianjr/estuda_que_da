class Customer {
  int id;
  String firstName;
  String lastName;
  String email;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> data) => new Customer(
    id: data["id"],
    firstName: data["first_name"],
    lastName: data["last_name"],
    email: data["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
  };
}