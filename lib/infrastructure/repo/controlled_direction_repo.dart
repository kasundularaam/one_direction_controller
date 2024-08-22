import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:one_direction_controller/domain/controlled_direction/controlled_direction.dart';
import 'package:one_direction_controller/domain/controlled_direction/i_controlled_direction_repo.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';
import 'package:one_direction_controller/infrastructure/services/controlled_direction_service.dart';

@LazySingleton(as: IControlledDirectionRepo)
class ControlledDirectionRepo implements IControlledDirectionRepo {
  final ControlledDirectionService _service;

  ControlledDirectionRepo(this._service);
  @override
  Either<Failure, Unit> turn(ControlledDirection direction) =>
      _service.turn(direction);

  @override
  void init(String address) => _service.init(address);

  @override
  Stream<bool> watchConnection() => _service.watchConnection();

  @override
  void dispose() => _service.dispose();
}
