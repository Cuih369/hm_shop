class BannerModel {
  String id;
  String imageUrl;

  BannerModel({required this.id, required this.imageUrl});
  // 从json创建BannerModel对象实例
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json['id'] ?? '', imageUrl: json['imgUrl'] ?? '');
  }
}
