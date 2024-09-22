import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_to_practice_testing/features/first_feature/data/datasources/albums_datasource.dart';
import 'package:project_to_practice_testing/features/first_feature/presentation/bloc/albums_bloc.dart';
import 'package:project_to_practice_testing/features/first_feature/presentation/bloc/albums_state.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

class MockAlbumsDataSource extends Mock implements AlbumsDataSource {}

void main() {
  late AlbumsDataSource albumsDataSource;
  registerFallbackValue(http.Client());

  blocTest<AlbumsBloc, AlbumsState>(
    "bloc emit states for getting albums test case success",
    setUp: () {
      albumsDataSource = MockAlbumsDataSource();
      when(
        () => albumsDataSource.fetchAlbum(),
      ).thenAnswer(
        (_) async {
          return const Album(userId: 1, id: 1, title: "quidem molestiae enim");
        },
      );
    },
    build: () {
      return AlbumsBloc(albumsDataSource);
    },
    act: (bloc) {
      bloc.add(GetAlbumsEvent());
    },
    expect: () {
      return const [
        AlbumsState(getAlbumRequestStatus: RequestStatus.loading),
        AlbumsState(
          getAlbumRequestStatus: RequestStatus.success,
          responseAlbum:
              Album(userId: 1, id: 1, title: "quidem molestiae enim"),
        )
      ];
    },
    verify: (bloc) {
      verify(() => albumsDataSource.fetchAlbum()).called(1);
      verifyNoMoreInteractions(albumsDataSource);
    },
  );

  blocTest<AlbumsBloc, AlbumsState>(
    "bloc emit states for getting albums test case failure",
    setUp: () {
      albumsDataSource = MockAlbumsDataSource();
      when(
        () => albumsDataSource.fetchAlbum(),
      ).thenThrow(Exception(["error"]));
    },
    build: () {
      return AlbumsBloc(albumsDataSource);
    },
    act: (bloc) {
      bloc.add(GetAlbumsEvent());
    },
    expect: () {
      return const [
        AlbumsState(getAlbumRequestStatus: RequestStatus.loading),
        AlbumsState(
          getAlbumRequestStatus: RequestStatus.failure,
        )
      ];
    },
    verify: (bloc) {
      verify(() => albumsDataSource.fetchAlbum()).called(1);
      verifyNoMoreInteractions(albumsDataSource);
    },
  );
}
