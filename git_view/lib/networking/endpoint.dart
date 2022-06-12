enum EndPoints { users, serarch, details }

class APIEndPoints {
  static String baseUrl = "https://api.github.com/";
  static String urlString(EndPoints endPoint) {
    return baseUrl + endPoint.endPointString;
  }
}

extension EndPointsExtension on EndPoints {
  String get endPointString {
    switch (this) {
      case EndPoints.users:
        return "users";
      case EndPoints.serarch:
        return "users/";
      case EndPoints.details:
        return "user/";
    }
  }
}
