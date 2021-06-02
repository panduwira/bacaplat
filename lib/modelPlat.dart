class PlatNomor {
  final String id;
  final String plat;
  final String date;

  PlatNomor(this.id, this.plat, this.date);

  @override
  List<Object> get props => [id, plat, date];
}
