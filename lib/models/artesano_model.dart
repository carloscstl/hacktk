class Artesano {
  Artesano({
    required this.name,
    required this.lastName,
    required this.admissionDate,
    required this.gender,
    required this.geoLocalization,
    this.image,
  });

  String name;
  String lastName;
  String admissionDate;
  String gender;
  String? image;
  List<String> geoLocalization;
}
