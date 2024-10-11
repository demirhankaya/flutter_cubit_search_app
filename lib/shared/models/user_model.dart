class UserModel {
  final String isim;
  final String soyad;
  final String meslek;
  final String not;

  UserModel(
      {required this.isim,
      required this.soyad,
      required this.meslek,
      required this.not});

  static final List<UserModel> mockUsers = [
    UserModel(
        isim: 'Demirhan',
        soyad: 'Kaya',
        meslek: 'Yazılım',
        not: '1 Not içeri kısımda yer alacaktır.'),
    UserModel(
        isim: 'Kerem',
        soyad: 'Karakoç',
        meslek: 'Yazılım',
        not: '2 Not içeri kısımda yer alacaktır.'),
    UserModel(
        isim: 'Ece',
        soyad: 'Naz',
        meslek: 'Emlak',
        not: '3 Not içeri kısımda yer alacaktır.'),
    UserModel(
        isim: 'Berna',
        soyad: 'Şimşek',
        meslek: 'Web & Yazılım',
        not: '4 Not içeri kısımda yer alacaktır.'),
  ];
}
