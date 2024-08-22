// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:one_direction_controller/core/extensions/dartz_x.dart';
import 'package:one_direction_controller/domain/controlled_direction/controlled_direction.dart';

import 'package:one_direction_controller/domain/controlled_direction/i_controlled_direction_repo.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';

@injectable
class ControlDirectionCubit extends Cubit<Option<Failure>> {
  final IControlledDirectionRepo _controlledDirectionRepo;
  ControlDirectionCubit(
    this._controlledDirectionRepo,
  ) : super(const None());

  void turn(ControlledDirection direction) {
    final failureOrNone = _controlledDirectionRepo.turn(direction);
    if (failureOrNone.isLeft()) {
      emit(Some(failureOrNone.getLeft()));
      return;
    }
    emit(const None());
  }
}
