class Toys {
  Toys(
      {this.idToy,
      this.nameToy,
      this.discription,
      this.image,
      this.type,
      this.price});

  factory Toys.fromJson(Map<String, dynamic> json) {
    return Toys(
      idToy: json['idToy'] as int,
      nameToy: json['nameToy'] as String,
      discription: json['discription'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      price: json['price'] as num,
    );
  }

  int idToy;
  String nameToy;
  String discription;
  String image;
  String type;
  num price;

  Map<String, dynamic> toJson() => {
        "idToy": idToy,
        "nameToy": nameToy,
        "discription": discription,
        "image": image,
        "type": type,
        "price": price,
      };
}
