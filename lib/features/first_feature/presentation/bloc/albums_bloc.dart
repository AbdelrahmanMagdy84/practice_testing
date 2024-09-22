import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_to_practice_testing/features/first_feature/data/datasources/albums_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:project_to_practice_testing/features/first_feature/presentation/bloc/albums_state.dart';
import 'package:http/http.dart' as http;
part 'albums_event.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc(
    this._albumsDataSource,
  ) : super(AlbumsState()) {
    on<GetAlbumsEvent>(_getAlbumsEventHandler);
  }
  final AlbumsDataSource _albumsDataSource;

  FutureOr<void> _getAlbumsEventHandler(
      GetAlbumsEvent event, Emitter<AlbumsState> emit) async {
    emit(state.copyWith(getAlbumRequestStatus: RequestStatus.loading));
    try {
      Album album = await _albumsDataSource.fetchAlbum();
      emit(
        state.copyWith(
          getAlbumRequestStatus: RequestStatus.success,
          responseAlbum: album,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          getAlbumRequestStatus: RequestStatus.failure,
        ),
      );
    }
  }
}
//success code
// emit(state.copyWith(getAlbumRequestStatus: RequestStatus.loading));
//     var album = await _albumsDataSource.fetchAlbum(_httpClient);
//     emit(
//       state.copyWith(
//         getAlbumRequestStatus: RequestStatus.success,
//         responseAlbum: album,
//       ),
//     );


//failure code
  //  emit(state.copyWith(getAlbumRequestStatus: RequestStatus.loading));
  //   try {
  //     var album = await _albumsDataSource.fetchAlbum(_httpClient);
  //     emit(
  //       state.copyWith(
  //         getAlbumRequestStatus: RequestStatus.success,
  //         responseAlbum: album,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(getAlbumRequestStatus: RequestStatus.failure));
  //   }
