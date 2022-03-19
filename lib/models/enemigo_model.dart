class EnemigoModel {

  int? monsterId;
  String? name;
  bool? boss;
  Stats? stats;
  Rewards? rewards;

  EnemigoModel(
      {this.monsterId,
      this.name,
      this.boss,
      this.stats,
      this.rewards});

  EnemigoModel.fromJson(Map<String, dynamic> json) {
    monsterId = json['monsterId'];
    name = json['name'];
    boss = json['boss'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    rewards =
        json['rewards'] != null ? new Rewards.fromJson(json['rewards']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monsterId'] = this.monsterId;
    data['name'] = this.name;
    data['boss'] = this.boss;
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    if (this.rewards != null) {
      data['rewards'] = this.rewards!.toJson();
    }
    return data;
  }
}

class Stats {
  int? magicDefense;
  int? speed;
  int? accuracy;
  int? maxHp;
  int? magicAttack;
  int? level;
  int? defense;
  int? attack;
  int? minPushDamage;
  int? maxMp;
  int? evasion;
  int? mpRecover;
  int? hpRecover;

  Stats(
      {this.magicDefense,
      this.speed,
      this.accuracy,
      this.maxHp,
      this.magicAttack,
      this.level,
      this.defense,
      this.attack,
      this.minPushDamage,
      this.maxMp,
      this.evasion,
      this.mpRecover,
      this.hpRecover});

  Stats.fromJson(Map<String, dynamic> json) {
    magicDefense = json['magicDefense'];
    speed = json['speed'];
    accuracy = json['accuracy'];
    maxHp = json['maxHp'];
    magicAttack = json['magicAttack'];
    level = json['level'];
    defense = json['defense'];
    attack = json['attack'];
    minPushDamage = json['minPushDamage'];
    maxMp = json['maxMp'];
    evasion = json['evasion'];
    mpRecover = json['mpRecover'];
    hpRecover = json['hpRecover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['magicDefense'] = this.magicDefense;
    data['speed'] = this.speed;
    data['accuracy'] = this.accuracy;
    data['maxHp'] = this.maxHp;
    data['magicAttack'] = this.magicAttack;
    data['level'] = this.level;
    data['defense'] = this.defense;
    data['attack'] = this.attack;
    data['minPushDamage'] = this.minPushDamage;
    data['maxMp'] = this.maxMp;
    data['evasion'] = this.evasion;
    data['mpRecover'] = this.mpRecover;
    data['hpRecover'] = this.hpRecover;
    return data;
  }
}

class Rewards {
  int? exp;
  bool? publicDrops;
  bool? explosiveDrops;

  Rewards({this.exp, this.publicDrops, this.explosiveDrops});

  Rewards.fromJson(Map<String, dynamic> json) {
    exp = json['exp'];
    publicDrops = json['publicDrops'];
    explosiveDrops = json['explosiveDrops'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exp'] = this.exp;
    data['publicDrops'] = this.publicDrops;
    data['explosiveDrops'] = this.explosiveDrops;
    return data;
  }
}