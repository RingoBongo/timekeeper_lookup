import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/constants.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';

abstract class TimeKeeperDetailRemoteDataSource {
  Future<List<TimeKeeperDetailModel>> getTimeKeepersFor(String tkinit);
}

class TimeKeeperDetailRemoteDataSourceImpl
    implements TimeKeeperDetailRemoteDataSource {
  final http.Client client;

  TimeKeeperDetailRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<TimeKeeperDetailModel>> getTimeKeepersFor(String tkinit) async {
    print('tits ${"$timekeeperDetailAPIEndpoint\/$tkinit"}');
    final response = await client.get(
      "$timekeeperDetailAPIEndpoint\/$tkinit",
      headers: {
        'Content-Type': 'application/json',
        'apikey': 'abc123',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      return (json.decode(response.body) as List)
          .map((i) => TimeKeeperDetailModel.fromJson(i))
          .toList();
    } else {
      throw Exception();
    }
  }
}
