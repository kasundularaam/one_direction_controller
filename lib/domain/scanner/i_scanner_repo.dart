import 'package:dartz/dartz.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';

abstract class IScannerRepo {
  Future<Either<Failure, String>> scan();
}
