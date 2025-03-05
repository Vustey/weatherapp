const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImg(String name) =>
      '$linkAsset${name.replaceAll('', '').toLowerCase()}.png';

}

class ApiKey {
  static const String apiKey = '6d6377a3b5e18211b7944d1937fcdfe4';
}
