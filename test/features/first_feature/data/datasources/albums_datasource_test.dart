import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as https;
import 'package:http/testing.dart';

import 'package:mocktail/mocktail.dart';
import 'package:project_to_practice_testing/features/first_feature/data/datasources/albums_datasource.dart';

class MockAlbumsDataSource extends Mock implements https.Client {}

void main() {
  late MockAlbumsDataSource mockClient;
  late AlbumsDataSource albumsDataSource;
  setUp(() {
    mockClient = MockAlbumsDataSource();
    albumsDataSource = AlbumsDataSource(client: mockClient);
  });
  group("testing api call", () {
    test(
      "test success case",
      () async {
        //  arrange

        when(() => mockClient.get(
                Uri.parse("https://jsonplaceholder.typicode.com/albums/1")))
            .thenAnswer(
          (_) async => https.Response(
            '{"userId": 1, "id": 2, "title": "mock"}',
            200,
          ),
        );

        //act
        var result = await albumsDataSource.fetchAlbum();

        // assert
        expect(result, isA<Album>());
      },
    );
    test(
      "failure case",
      () {
        //arrange

        when(() => mockClient.get(
                Uri.parse("https://jsonplaceholder.typicode.com/albums/1")))
            .thenAnswer((_) async => https.Response("not found", 404));
        //act
        // var result = ;
        //assert
        expect(
            () async => await albumsDataSource.fetchAlbum(), throwsException);
      },
    );
  });
}
