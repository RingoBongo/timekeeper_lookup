import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/features/timekeepers/data/datasources/timekeeper_detail_remote_data_source.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {

  TimeKeeperDetailRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TimeKeeperDetailRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getTimekeeperDetail', () {
    String tkinit = 'JJJ';

    // test('should preform a GET request on a URL and with application/json header', () async {
    //   //arrange
    //   when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
    //         (_) async => http.Response(
    //       fixtureMeeting('meeting_by_pgdept_technology_list.json'),
    //       200,
    //       headers: {
    //         HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    //         'apikey': 'abc123',
    //         'rowcount': '100',
    //         "practicegroupdepartment": tPGDept,
    //       },
    //     ),
    //   );
    //   // act
    //   final response = dataSource.getMeetingsByPGDept(tPGDept);
    //   print(response);
    //   // assert
    //   verify(mockHttpClient.get(
    //     meetingPGDeptAPIEndpoint,
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'apikey': 'abc123',
    //       'rowcount': '100',
    //       "practicegroupdepartment": tPGDept,
    //     },
    //   ));
    // });
    //
    // test('should throw a ServerException when the response code is 404 or other', () async {
    //   // arrange
    //   when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
    //         (_) async => http.Response('Something went wrong', 404),
    //   );
    //   // act
    //   final call = dataSource.getMeetingsByPGDept;
    //   // assert
    //   expect(() => call(tPGDept), throwsA(isA<ServerException>()));
    // });
    //
    test('should return a list of TimekeeperDetailModel', () async {
      //arrange
      dataSource = TimeKeeperDetailRemoteDataSourceImpl(client: http.Client());
      // act
      final response = await dataSource.getTimeKeepersFor(tkinit);
      // assert
      final expectedJsonMap =
      (json.decode(fixtureTimeKeeperDetail('timekeeper_detail_jjj_list.json')) as List).map((i) => TimeKeeperDetailModel.fromJson(i)).toList();

      expect(response, expectedJsonMap);
    });
  });
}