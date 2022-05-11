class News {
  News({
    this.idNews,
    this.name,
    this.discription,
    this.dataTime,
    this.idUser,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      idNews: json['idNews'] as int,
      name: json['name'] as String,
      discription: json['discription'] as String,
      dataTime: json['dataTime'] as String,
      idUser: json['idUser'] as int,
    );
  }

  int idNews;
  String name;
  String discription;
  String dataTime;
  int idUser;

  Map<String, dynamic> toJson() => {
        "idNews": idNews,
        "name": name,
        "discription": discription,
        "dataTime": dataTime,
        "idUser": idUser,
      };
}
