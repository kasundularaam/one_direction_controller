part of 'connection_cubit.dart';

@freezed
abstract class ConnectionState with _$ConnectionState {
  const factory ConnectionState({required bool controlledDirection}) =
      _ConnectionState;
}
