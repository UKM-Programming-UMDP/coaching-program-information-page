import 'dart:convert';

class Character {
  String name;
  String? title;
  Vision vision;
  Weapon weapon;
  Gender? gender;
  Nation nation;
  String affiliation;
  int rarity;
  DateTime release;
  String constellation;
  String birthday;
  String description;
  List<SkillTalent> skillTalents;
  List<Constellation> passiveTalents;
  List<Constellation> constellations;
  VisionKey visionKey;
  WeaponType weaponType;
  AscensionMaterials ascensionMaterials;
  String id;
  String? specialDish;
  List<Outfit>? outfits;
  String? nameKey;

  Character({
    required this.name,
    this.title,
    required this.vision,
    required this.weapon,
    this.gender,
    required this.nation,
    required this.affiliation,
    required this.rarity,
    required this.release,
    required this.constellation,
    required this.birthday,
    required this.description,
    required this.skillTalents,
    required this.passiveTalents,
    required this.constellations,
    required this.visionKey,
    required this.weaponType,
    required this.ascensionMaterials,
    required this.id,
    this.specialDish,
    this.outfits,
    this.nameKey,
  });

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        title: json["title"],
        vision: visionValues.map[json["vision"]]!,
        weapon: weaponValues.map[json["weapon"]]!,
        gender: genderValues.map[json["gender"]]!,
        nation: nationValues.map[json["nation"]]!,
        affiliation: json["affiliation"],
        rarity: json["rarity"],
        release: DateTime.parse(json["release"]),
        constellation: json["constellation"],
        birthday: json["birthday"],
        description: json["description"],
        skillTalents: List<SkillTalent>.from(
            json["skillTalents"].map((x) => SkillTalent.fromJson(x))),
        passiveTalents: List<Constellation>.from(
            json["passiveTalents"].map((x) => Constellation.fromJson(x))),
        constellations: List<Constellation>.from(
            json["constellations"].map((x) => Constellation.fromJson(x))),
        visionKey: visionKeyValues.map[json["vision_key"]]!,
        weaponType: weaponTypeValues.map[json["weapon_type"]]!,
        ascensionMaterials:
            AscensionMaterials.fromJson(json["ascension_materials"]),
        id: json["id"],
        specialDish: json["specialDish"],
        outfits: json["outfits"] == null
            ? []
            : List<Outfit>.from(
                json["outfits"]!.map((x) => Outfit.fromJson(x))),
        nameKey: json["name_key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "vision": visionValues.reverse[vision],
        "weapon": weaponValues.reverse[weapon],
        "gender": genderValues.reverse[gender],
        "nation": nationValues.reverse[nation],
        "affiliation": affiliation,
        "rarity": rarity,
        "release":
            "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "constellation": constellation,
        "birthday": birthday,
        "description": description,
        "skillTalents": List<dynamic>.from(skillTalents.map((x) => x.toJson())),
        "passiveTalents":
            List<dynamic>.from(passiveTalents.map((x) => x.toJson())),
        "constellations":
            List<dynamic>.from(constellations.map((x) => x.toJson())),
        "vision_key": visionKeyValues.reverse[visionKey],
        "weapon_type": weaponTypeValues.reverse[weaponType],
        "ascension_materials": ascensionMaterials.toJson(),
        "id": id,
        "specialDish": specialDish,
        "outfits": outfits == null
            ? []
            : List<dynamic>.from(outfits!.map((x) => x.toJson())),
        "name_key": nameKey,
      };
}

class AscensionMaterials {
  List<Level> level20;
  List<Level> level40;
  List<Level> level50;
  List<Level> level60;
  List<Level> level70;
  List<Level> level80;

  AscensionMaterials({
    required this.level20,
    required this.level40,
    required this.level50,
    required this.level60,
    required this.level70,
    required this.level80,
  });

  factory AscensionMaterials.fromRawJson(String str) =>
      AscensionMaterials.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AscensionMaterials.fromJson(Map<String, dynamic> json) =>
      AscensionMaterials(
        level20:
            List<Level>.from(json["level_20"].map((x) => Level.fromJson(x))),
        level40:
            List<Level>.from(json["level_40"].map((x) => Level.fromJson(x))),
        level50:
            List<Level>.from(json["level_50"].map((x) => Level.fromJson(x))),
        level60:
            List<Level>.from(json["level_60"].map((x) => Level.fromJson(x))),
        level70:
            List<Level>.from(json["level_70"].map((x) => Level.fromJson(x))),
        level80:
            List<Level>.from(json["level_80"].map((x) => Level.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level_20": List<dynamic>.from(level20.map((x) => x.toJson())),
        "level_40": List<dynamic>.from(level40.map((x) => x.toJson())),
        "level_50": List<dynamic>.from(level50.map((x) => x.toJson())),
        "level_60": List<dynamic>.from(level60.map((x) => x.toJson())),
        "level_70": List<dynamic>.from(level70.map((x) => x.toJson())),
        "level_80": List<dynamic>.from(level80.map((x) => x.toJson())),
      };
}

class Level {
  String name;
  int value;

  Level({
    required this.name,
    required this.value,
  });

  factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Constellation {
  String name;
  ConstellationUnlock unlock;
  String description;
  int? level;

  Constellation({
    required this.name,
    required this.unlock,
    required this.description,
    this.level,
  });

  factory Constellation.fromRawJson(String str) =>
      Constellation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Constellation.fromJson(Map<String, dynamic> json) => Constellation(
        name: json["name"],
        unlock: constellationUnlockValues.map[json["unlock"]]!,
        description: json["description"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": constellationUnlockValues.reverse[unlock],
        "description": description,
        "level": level,
      };
}

enum ConstellationUnlock {
  CONSTELLATION_LV_1,
  CONSTELLATION_LV_2,
  CONSTELLATION_LV_3,
  CONSTELLATION_LV_4,
  CONSTELLATION_LV_5,
  CONSTELLATION_LV_6,
  NIGHT_REALM_S_GIFT_PASSIVE,
  UNLOCKED_AT_ASCENSION_1,
  UNLOCKED_AT_ASCENSION_4,
  UNLOCKED_AUTOMATICALLY
}

final constellationUnlockValues = EnumValues({
  "Constellation Lv. 1": ConstellationUnlock.CONSTELLATION_LV_1,
  "Constellation Lv. 2": ConstellationUnlock.CONSTELLATION_LV_2,
  "Constellation Lv. 3": ConstellationUnlock.CONSTELLATION_LV_3,
  "Constellation Lv. 4": ConstellationUnlock.CONSTELLATION_LV_4,
  "Constellation Lv. 5": ConstellationUnlock.CONSTELLATION_LV_5,
  "Constellation Lv. 6": ConstellationUnlock.CONSTELLATION_LV_6,
  "Night Realm's Gift Passive": ConstellationUnlock.NIGHT_REALM_S_GIFT_PASSIVE,
  "Unlocked at Ascension 1": ConstellationUnlock.UNLOCKED_AT_ASCENSION_1,
  "Unlocked at Ascension 4": ConstellationUnlock.UNLOCKED_AT_ASCENSION_4,
  "Unlocked Automatically": ConstellationUnlock.UNLOCKED_AUTOMATICALLY
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

enum Nation {
  FONTAINE,
  INAZUMA,
  LIYUE,
  MONDSTADT,
  NATLAN,
  OUTLANDER,
  SNEZHNAYA,
  SUMERU,
  UNKNOWN
}

final nationValues = EnumValues({
  "Fontaine": Nation.FONTAINE,
  "Inazuma": Nation.INAZUMA,
  "Liyue": Nation.LIYUE,
  "Mondstadt": Nation.MONDSTADT,
  "Natlan": Nation.NATLAN,
  "Outlander": Nation.OUTLANDER,
  "Snezhnaya": Nation.SNEZHNAYA,
  "Sumeru": Nation.SUMERU,
  "Unknown": Nation.UNKNOWN
});

class Outfit {
  String type;
  String name;
  String description;
  int rarity;
  String image;
  int? price;

  Outfit({
    required this.type,
    required this.name,
    required this.description,
    required this.rarity,
    required this.image,
    this.price,
  });

  factory Outfit.fromRawJson(String str) => Outfit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Outfit.fromJson(Map<String, dynamic> json) => Outfit(
        type: json["type"],
        name: json["name"],
        description: json["description"],
        rarity: json["rarity"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "rarity": rarity,
        "image": image,
        "price": price,
      };
}

class SkillTalent {
  String name;
  SkillTalentUnlock unlock;
  String description;
  List<Upgrade> upgrades;
  Type? type;
  List<Upgrade>? attributeScaling;

  SkillTalent({
    required this.name,
    required this.unlock,
    required this.description,
    required this.upgrades,
    this.type,
    this.attributeScaling,
  });

  factory SkillTalent.fromRawJson(String str) =>
      SkillTalent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SkillTalent.fromJson(Map<String, dynamic> json) => SkillTalent(
        name: json["name"],
        unlock: skillTalentUnlockValues.map[json["unlock"]]!,
        description: json["description"],
        upgrades: List<Upgrade>.from(
            json["upgrades"].map((x) => Upgrade.fromJson(x))),
        type: typeValues.map[json["type"]]!,
        attributeScaling: json["attribute-scaling"] == null
            ? []
            : List<Upgrade>.from(
                json["attribute-scaling"]!.map((x) => Upgrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": skillTalentUnlockValues.reverse[unlock],
        "description": description,
        "upgrades": List<dynamic>.from(upgrades.map((x) => x.toJson())),
        "type": typeValues.reverse[type],
        "attribute-scaling": attributeScaling == null
            ? []
            : List<dynamic>.from(attributeScaling!.map((x) => x.toJson())),
      };
}

class Upgrade {
  String name;
  String value;

  Upgrade({
    required this.name,
    required this.value,
  });

  factory Upgrade.fromRawJson(String str) => Upgrade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Upgrade.fromJson(Map<String, dynamic> json) => Upgrade(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

enum Type { ELEMENTAL_BURST, ELEMENTAL_SKILL, NORMAL_ATTACK }

final typeValues = EnumValues({
  "ELEMENTAL_BURST": Type.ELEMENTAL_BURST,
  "ELEMENTAL_SKILL": Type.ELEMENTAL_SKILL,
  "NORMAL_ATTACK": Type.NORMAL_ATTACK
});

enum SkillTalentUnlock {
  ELEMENTAL_BURST,
  ELEMENTAL_SKILL,
  NORMAL_ATTACK,
  RIGHT_CLICK,
  UNLOCK_ELEMENTAL_BURST,
  UNLOCK_ELEMENTAL_SKILL,
  UNLOCK_NORMAL_ATTACK
}

final skillTalentUnlockValues = EnumValues({
  "Elemental Burst": SkillTalentUnlock.ELEMENTAL_BURST,
  "Elemental Skill": SkillTalentUnlock.ELEMENTAL_SKILL,
  "Normal Attack": SkillTalentUnlock.NORMAL_ATTACK,
  "Right Click": SkillTalentUnlock.RIGHT_CLICK,
  "Elemental burst": SkillTalentUnlock.UNLOCK_ELEMENTAL_BURST,
  "Elemental skill": SkillTalentUnlock.UNLOCK_ELEMENTAL_SKILL,
  "Normal attack": SkillTalentUnlock.UNLOCK_NORMAL_ATTACK
});

enum Vision { ANEMO, CRYO, DENDRO, ELECTRO, GEO, HYDRO, PYRO }

final visionValues = EnumValues({
  "Anemo": Vision.ANEMO,
  "Cryo": Vision.CRYO,
  "Dendro": Vision.DENDRO,
  "Electro": Vision.ELECTRO,
  "Geo": Vision.GEO,
  "Hydro": Vision.HYDRO,
  "Pyro": Vision.PYRO
});

enum VisionKey { ANEMO, CRYO, DENDRO, ELECTRO, GEO, HYDRO, PYRO }

final visionKeyValues = EnumValues({
  "ANEMO": VisionKey.ANEMO,
  "CRYO": VisionKey.CRYO,
  "DENDRO": VisionKey.DENDRO,
  "ELECTRO": VisionKey.ELECTRO,
  "GEO": VisionKey.GEO,
  "HYDRO": VisionKey.HYDRO,
  "PYRO": VisionKey.PYRO
});

enum Weapon { BOW, CATALYST, CLAYMORE, POLEARM, SWORD }

final weaponValues = EnumValues({
  "Bow": Weapon.BOW,
  "Catalyst": Weapon.CATALYST,
  "Claymore": Weapon.CLAYMORE,
  "Polearm": Weapon.POLEARM,
  "Sword": Weapon.SWORD
});

enum WeaponType { BOW, CATALYST, CLAYMORE, POLEARM, SWORD }

final weaponTypeValues = EnumValues({
  "BOW": WeaponType.BOW,
  "CATALYST": WeaponType.CATALYST,
  "CLAYMORE": WeaponType.CLAYMORE,
  "POLEARM": WeaponType.POLEARM,
  "SWORD": WeaponType.SWORD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
