class Places {
  List<CentralProvince>? centralProvince;
  List<EasternProvince>? easternProvince;
  List<NorthCentralProvince>? northCentralProvince;
  List<NorthProvince>? northProvince;
  List<NorthwestProvince>? northwestProvince;
  List<SabaragamuwaProvince>? sabaragamuwaProvince;
  List<SouthernProvince>? southernProvince;
  List<UvaProvince>? uvaProvince;
  List<WesternProvince>? westernProvince;

  Places(
      {this.centralProvince,
      this.easternProvince,
      this.northCentralProvince,
      this.northProvince,
      this.northwestProvince,
      this.sabaragamuwaProvince,
      this.southernProvince,
      this.uvaProvince,
      this.westernProvince});

  Places.fromJson(Map<String, dynamic> json) {
    if (json['Southern Province'] != null) {
      southernProvince = <SouthernProvince>[];
      json['Southern Province'].forEach((v) {
        southernProvince!.add(SouthernProvince.fromJson(v));
      });
    }
    if (json['Western Province'] != null) {
      westernProvince = <WesternProvince>[];
      json['Western Province'].forEach((v) {
        westernProvince!.add(WesternProvince.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (southernProvince != null) {
      data['Southern Province'] =
          southernProvince!.map((v) => v.toJson()).toList();
    }
    if (westernProvince != null) {
      data['Western Province'] =
          westernProvince!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SouthernProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  SouthernProvince({this.id, this.attributes, this.relationships});

  SouthernProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class WesternProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  WesternProvince({this.id, this.attributes, this.relationships});

  WesternProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class CentralProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  CentralProvince({this.id, this.attributes, this.relationships});

  CentralProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class EasternProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  EasternProvince({this.id, this.attributes, this.relationships});

  EasternProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class NorthCentralProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  NorthCentralProvince({this.id, this.attributes, this.relationships});

  NorthCentralProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class NorthProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  NorthProvince({this.id, this.attributes, this.relationships});

  NorthProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class NorthwestProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  NorthwestProvince({this.id, this.attributes, this.relationships});

  NorthwestProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class SabaragamuwaProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  SabaragamuwaProvince({this.id, this.attributes, this.relationships});

  SabaragamuwaProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class UvaProvince {
  String? id;
  Attributes? attributes;
  Relationships? relationships;

  UvaProvince({this.id, this.attributes, this.relationships});

  UvaProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? isFavourite;
  String? description;
  String? image;
  String? coordinates;
  String? province;
  String? address;
  String? distance;
  String? byCar;
  String? byBike;
  String? createdAt;
  String? updatedAt;

  Attributes(
      {this.name,
      this.isFavourite,
      this.description,
      this.image,
      this.coordinates,
      this.province,
      this.address,
      this.distance,
      this.byCar,
      this.byBike,
      this.createdAt,
      this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isFavourite = json['is_favourite'];
    description = json['description'];
    image = json['image'];
    coordinates = json['coordinates'];
    province = json['province'];
    address = json['address'];
    distance = json['distance'];
    byCar = json['by_car'];
    byBike = json['by_bike'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['is_favourite'] = isFavourite;
    data['description'] = description;
    data['image'] = image;
    data['coordinates'] = coordinates;
    data['province'] = province;
    data['address'] = address;
    data['distance'] = distance;
    data['by_car'] = byCar;
    data['by_bike'] = byBike;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Relationships {
  int? userId;

  Relationships({this.userId});

  Relationships.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    return data;
  }
}
