// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        required this.id,
        required this.userName,
        required this.products,
    });

    String id;
    String userName;
    List<dynamic> products;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "userName": userName,
        "products": List<dynamic>.from(products.map((x) => x)),
    };
}
