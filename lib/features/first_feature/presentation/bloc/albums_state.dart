// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:project_to_practice_testing/features/first_feature/data/datasources/albums_datasource.dart';

enum RequestStatus { initial, loading, success, failure }

class AlbumsState extends Equatable {
  final RequestStatus getAlbumRequestStatus;
  final Album? responseAlbum;

  const AlbumsState({
    this.getAlbumRequestStatus = RequestStatus.initial,
    this.responseAlbum,
  });

  @override
  List<Object?> get props => [getAlbumRequestStatus, responseAlbum];

  AlbumsState copyWith({
    RequestStatus? getAlbumRequestStatus,
    Album? responseAlbum,
  }) {
    return AlbumsState(
      getAlbumRequestStatus:
          getAlbumRequestStatus ?? this.getAlbumRequestStatus,
      responseAlbum: responseAlbum ?? this.responseAlbum,
    );
  }
}
