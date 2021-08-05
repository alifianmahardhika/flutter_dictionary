import 'package:http/http.dart' as http;

class HttpService {
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/";
  static Future<http.Response> getRequest(endpoint) async {
    http.Response response;
    try {
      response = await http.get(Uri.parse("$baseURL$endpoint"));
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
