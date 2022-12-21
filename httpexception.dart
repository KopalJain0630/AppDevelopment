import 'package:http/http.dart' as http;

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
    // return super.toString();
  }
}
//