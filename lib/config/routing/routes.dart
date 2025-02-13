class Routes {
  static String explore({String? gender, String? style}) {
    final queryParams = <String, String>{};
    if (gender != null) queryParams['gender'] = Uri.encodeComponent(gender);
    if (style != null) queryParams['style'] = Uri.encodeComponent(style);
    final queryString = queryParams.entries.map((e) => "${e.key}=${e.value}").join("&");
    return queryString.isNotEmpty ? "/explore?$queryString" : "/explore";
  }

  static clothingSet(String id) => '/explore/set/$id';
}
