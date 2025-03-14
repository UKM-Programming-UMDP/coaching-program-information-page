import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
    String name;
    String title;
    String vision;
    String weapon;
    String gender;
    String nation;
    String affiliation;
    int rarity;
    DateTime release;
    String constellation;
    DateTime birthday;
    String description;
    List<SkillTalent> skillTalents;
    List<Constellation> passiveTalents;
    List<Constellation> constellations;
    String visionKey;
    String weaponType;
    AscensionMaterials ascensionMaterials;
    String id;

    Character({
        required this.name,
        required this.title,
        required this.vision,
        required this.weapon,
        required this.gender,
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
    });

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json["name"],
        title: json["title"],
        vision: json["vision"],
        weapon: json["weapon"],
        gender: json["gender"],
        nation: json["nation"],
        affiliation: json["affiliation"],
        rarity: json["rarity"],
        release: DateTime.parse(json["release"]),
        constellation: json["constellation"],
        birthday: DateTime.parse(json["birthday"]),
        description: json["description"],
        skillTalents: List<SkillTalent>.from(json["skillTalents"].map((x) => SkillTalent.fromJson(x))),
        passiveTalents: List<Constellation>.from(json["passiveTalents"].map((x) => Constellation.fromJson(x))),
        constellations: List<Constellation>.from(json["constellations"].map((x) => Constellation.fromJson(x))),
        visionKey: json["vision_key"],
        weaponType: json["weapon_type"],
        ascensionMaterials: AscensionMaterials.fromJson(json["ascension_materials"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "vision": vision,
        "weapon": weapon,
        "gender": gender,
        "nation": nation,
        "affiliation": affiliation,
        "rarity": rarity,
        "release": "${release.year.toString().padLeft(4, '0')}-${release.month.toString().padLeft(2, '0')}-${release.day.toString().padLeft(2, '0')}",
        "constellation": constellation,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "description": description,
        "skillTalents": List<dynamic>.from(skillTalents.map((x) => x.toJson())),
        "passiveTalents": List<dynamic>.from(passiveTalents.map((x) => x.toJson())),
        "constellations": List<dynamic>.from(constellations.map((x) => x.toJson())),
        "vision_key": visionKey,
        "weapon_type": weaponType,
        "ascension_materials": ascensionMaterials.toJson(),
        "id": id,
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

    factory AscensionMaterials.fromJson(Map<String, dynamic> json) => AscensionMaterials(
        level20: List<Level>.from(json["level_20"].map((x) => Level.fromJson(x))),
        level40: List<Level>.from(json["level_40"].map((x) => Level.fromJson(x))),
        level50: List<Level>.from(json["level_50"].map((x) => Level.fromJson(x))),
        level60: List<Level>.from(json["level_60"].map((x) => Level.fromJson(x))),
        level70: List<Level>.from(json["level_70"].map((x) => Level.fromJson(x))),
        level80: List<Level>.from(json["level_80"].map((x) => Level.fromJson(x))),
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
    String unlock;
    String description;
    int? level;

    Constellation({
        required this.name,
        required this.unlock,
        required this.description,
        this.level,
    });

    factory Constellation.fromJson(Map<String, dynamic> json) => Constellation(
        name: json["name"],
        unlock: json["unlock"],
        description: json["description"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": unlock,
        "description": description,
        "level": level,
    };
}

class SkillTalent {
    String name;
    String unlock;
    String description;
    List<AttributeScaling> upgrades;
    String type;
    List<AttributeScaling> attributeScaling;

    SkillTalent({
        required this.name,
        required this.unlock,
        required this.description,
        required this.upgrades,
        required this.type,
        required this.attributeScaling,
    });

    factory SkillTalent.fromJson(Map<String, dynamic> json) => SkillTalent(
        name: json["name"],
        unlock: json["unlock"],
        description: json["description"],
        upgrades: List<AttributeScaling>.from(json["upgrades"].map((x) => AttributeScaling.fromJson(x))),
        type: json["type"],
        attributeScaling: List<AttributeScaling>.from(json["attribute-scaling"].map((x) => AttributeScaling.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": unlock,
        "description": description,
        "upgrades": List<dynamic>.from(upgrades.map((x) => x.toJson())),
        "type": type,
        "attribute-scaling": List<dynamic>.from(attributeScaling.map((x) => x.toJson())),
    };
}

class AttributeScaling {
    String name;
    String value;

    AttributeScaling({
        required this.name,
        required this.value,
    });

    factory AttributeScaling.fromJson(Map<String, dynamic> json) => AttributeScaling(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
