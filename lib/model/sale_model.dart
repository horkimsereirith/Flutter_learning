class sale {}

class Delivery {
  final String id;
  final String name;
  final double? deliveryPrice;
  final String? phonenumber;

  Delivery({
    required this.id,
    required this.name,
    this.deliveryPrice,
    this.phonenumber,
  });
}

class Product {
  final String id;
  final String name;
  final double? price;

  Product({
    required this.id,
    required this.name,
    this.price,
  });
}

class FacebookPage {
  final String id;
  final String name;
  final String? facebookLink;
  final String? mobilePhone;
  final String? otherPhone;
  final String? address;

  FacebookPage({
    required this.id,
    required this.name,
    this.facebookLink,
    this.mobilePhone,
    this.otherPhone,
    this.address,
  });
}
