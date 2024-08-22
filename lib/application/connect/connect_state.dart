part of 'connect_cubit.dart';

@freezed
class ConnectState with _$ConnectState {
  const factory ConnectState.initial() = _Initial;
  const factory ConnectState.loading() = _Loading;
  const factory ConnectState.succeed() = _Succeed;
  const factory ConnectState.failed(Failure failure) = _Failed;
}
