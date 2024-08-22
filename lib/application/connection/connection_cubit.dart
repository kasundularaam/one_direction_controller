// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:one_direction_controller/domain/controlled_direction/i_controlled_direction_repo.dart';

part 'connection_cubit.freezed.dart';
part 'connection_state.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final IControlledDirectionRepo _controlledDirectionRepo;

  ConnectionCubit(
    this._controlledDirectionRepo,
  ) : super(const ConnectionState(controlledDirection: false));

  void watchConnections() {
    _controlledDirectionRepo.watchConnection().listen((isConnected) {
      emit(state.copyWith(controlledDirection: isConnected));
    });
  }

  @override
  Future<void> close() {
    _controlledDirectionRepo.dispose();
    return super.close();
  }
}
