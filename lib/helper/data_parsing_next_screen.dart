class User_Info {
  String firstName;
  String lastName;
  int contactNumber;
  String email;
  String password;
  String? preference = 'other';
  String? address = '';

  User_Info(
    {
    this.address,
    this.preference,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.email,
    required this.password,
  });

}