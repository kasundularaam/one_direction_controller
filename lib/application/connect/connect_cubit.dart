// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:one_direction_controller/core/extensions/dartz_x.dart';

import 'package:one_direction_controller/domain/controlled_direction/i_controlled_direction_repo.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';
import 'package:one_direction_controller/domain/scanner/i_scanner_repo.dart';

part 'connect_cubit.freezed.dart';
part 'connect_state.dart';

@injectable
class ConnectCubit extends Cubit<ConnectState> {
  final IControlledDirectionRepo _controlledDirectionRepo;
  final IScannerRepo _scannerRepo;
  ConnectCubit(
    this._controlledDirectionRepo,
    this._scannerRepo,
  ) : super(const ConnectState.initial());

  Future<void> connect() async {
    emit(const ConnectState.loading());
    final addressOrFailure = await _scannerRepo.scan();
    if (addressOrFailure.isLeft()) {
      emit(ConnectState.failed(addressOrFailure.getLeft()));
      return;
    }
    _controlledDirectionRepo.init(addressOrFailure.getOrCrash());
    emit(const ConnectState.succeed());
  }
}
