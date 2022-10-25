import 'dart:convert';

import 'package:electricity_tariff/data/models/tariff_model.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

abstract class RemoteDataSource {
  Future<List<TariffModel>> getTariffPlans();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<TariffModel>> getTariffPlans() async {
    final data = await http.get(Uri.parse(Urls.baseUrl));
    var response = json.decode(data.body);
    List<dynamic> list = response['results'];
    var modelList = list.map((e) => TariffModel.fromJson(e)).toList();
    return modelList;
  }
}
