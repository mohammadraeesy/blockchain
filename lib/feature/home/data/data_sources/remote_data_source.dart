import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uni_project/feature/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CoinEntityModel>> getData(int page);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<CoinEntityModel>> getData(int page) async {
    try {
      var url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true');
      var response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        }
      );
      if (response.statusCode == 200) {
        final decodeJson = json.decode(response.body);
        print(decodeJson);
        List<CoinEntityModel> homeEntityModelList = List<CoinEntityModel>.from(
          decodeJson.map(
            (x) => CoinEntityModel.fromJson(x),
          ),
        );
        return homeEntityModelList;
      } else {
        throw FormatException(
            (jsonDecode(response.body))["message"].toString());
      }
    } catch (e) {
      throw Exception();
    }
  }
}


///https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true
