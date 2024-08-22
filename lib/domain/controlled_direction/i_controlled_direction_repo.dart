import 'package:dartz/dartz.dart';
import 'package:one_direction_controller/domain/controlled_direction/controlled_direction.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';

abstract class IControlledDirectionRepo {
  Either<Failure, Unit> turn(ControlledDirection direction);
  void init(String address);
  Stream<bool> watchConnection();
  void dispose();
}
