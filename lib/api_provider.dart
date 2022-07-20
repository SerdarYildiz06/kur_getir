import 'package:flutter/cupertino.dart';
import 'package:kurgetir/api_service.dart';
import 'package:kurgetir/kur_model.dart';

class ApiProvider extends ChangeNotifier {
  KurModel? model;
  bool loading = false;

  getKur() async {
    loading = true;
    model = await getUserList();
    loading = false;

    notifyListeners();
  }
}
