class User {
  ///
  final String? name;
  final String? surname;
  final String? job;
  final String? note;

  ///
  const User({
    this.name,
    this.surname,
    this.job,
    this.note,
  });

  ///
  static final List<User> mockUsers = [
    const User(
      name: 'Demirhan',
      surname: 'Kaya',
      job: 'Yazılım',
      note: '1 Not içeri kısımda yer alacaktır.',
    ),
    const User(
      name: 'Kerem',
      surname: 'Karakoç',
      job: 'Yazılım',
      note: '2 Not içeri kısımda yer alacaktır.',
    ),
    const User(
      name: 'Ece',
      surname: 'Naz',
      job: 'Emlak',
      note: '3 Not içeri kısımda yer alacaktır.',
    ),
    const User(
      name: 'Berna',
      surname: 'Şimşek',
      job: 'Web & Yazılım',
      note: '4 Not içeri kısımda yer alacaktır.',
    ),
  ];
}
