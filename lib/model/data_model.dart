  class ShlokModel {
    String? shlok;
    String? saar;
    String? saar_guj;
    String? saar_enj;
    String? img;

    ShlokModel({
      this.shlok,
      this.saar,
      this.saar_guj,
      this.saar_enj,
      this.img,
    });

    factory ShlokModel.fromJson(Map<String, dynamic> json) {
      return ShlokModel(
        shlok: json['shlok'],
        saar: json['saar'],
        saar_guj: json['saar_guj'],
        saar_enj: json['saar_enj'],
        img: json['img'],
      );
    }
  }
