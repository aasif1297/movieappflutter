class Person {
  final int id;
  final double popularity;
  final String name;
  final String profileImg;
  final String known;

  Person(this.id, this.name, this.popularity, this.profileImg, this.known);

  Person.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        popularity = json["popularity"],
        profileImg = json["profile_path"],
        known = json["known_for_department"];
}
