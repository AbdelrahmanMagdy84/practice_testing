part of 'albums_bloc.dart';

@immutable
sealed class AlbumsEvent {}

class GetAlbumsEvent extends AlbumsEvent {}
