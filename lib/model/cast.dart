class Cast {
  final int id;
  final String character;
  final String name;
  final String image;

  Cast(this.id, this.character, this.name, this.image);

  Cast.fromJson(Map<String, dynamic> json)
      : id = json["cast_id"],
        character = json["character"],
        name = json["name"],
        image = json["profile_path"];
}
