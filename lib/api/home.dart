import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/Home.dart';

Future<List<BannerModel>> getBannerList() async {
  return ((await dioRequest.get(HttpConstants.bannerList)) as List<dynamic>)
      .map((e) => BannerModel.fromJson(e))
      .toList();
}
