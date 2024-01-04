import 'package:http/http.dart' as http;
import 'package:my_ui/const.dart';

class CategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/products';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl/categories'),
    );
    return response;
  }
}
