class Pokemon {
  String id;
  String name;

  Pokemon({
    required this.id,
    required this.name,
  });

  Pokemon.fromJson(dynamic obj)
      : name = obj["name"] as String,
        id = (obj["url"] as String).split('/pokemon/').last.replaceAll('/', '');
}
