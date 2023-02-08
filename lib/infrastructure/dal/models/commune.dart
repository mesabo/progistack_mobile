import 'package:flutter_map/flutter_map.dart';

class Commune {
  int? id;
  String? name;
  List<Address>? address;

  Commune({this.id, this.name, this.address});


  Commune.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? name;
  Marker? marker;

  Address({this.name, this.marker});

   Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    marker = json['marker'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['marker'] = marker;
    return data;
  }
}
