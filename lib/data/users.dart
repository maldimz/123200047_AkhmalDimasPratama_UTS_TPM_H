class Users {
  String username;
  String password;
  String name;
  String born;
  String classes;
  String hope;
  String image;

  Users({
    required this.username,
    required this.password,
    required this.name,
    required this.born,
    required this.classes,
    required this.hope,
    required this.image,
  });
}

var usersList = [
  Users(
      username: '123200047',
      password: 'dimas',
      name: 'Akhmal Dimas Pratama',
      born: 'Jombang, 20 Juli 2002',
      classes: 'TPM IF-H',
      hope: 'Menjadi Pengusaha Sukses',
      image: 'assets/images/dimas.jpg')
];
