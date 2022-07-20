import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kurgetir/kur_model.dart';

Future<KurModel?> getUserList() async {
  KurModel? result;

  final response = await http.get(
    Uri.parse("http://hasanadiguzel.com.tr/api/kurgetir"),
  );

  final item = json.decode(response.body);
  print("item" + item.toString());
  result = KurModel.fromJson(item);
  print("RESULT" + result.toString());
  return result;
}
