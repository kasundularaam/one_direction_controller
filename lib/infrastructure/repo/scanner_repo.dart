// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:one_direction_controller/domain/failure/failure.dart';
import 'package:one_direction_controller/domain/scanner/i_scanner_repo.dart';
import 'package:one_direction_controller/infrastructure/services/scanner_service.dart';

@LazySingleton(as: IScannerRepo)
class ScannerRepo implements IScannerRepo {
  final ScannerService _scannerService;
  ScannerRepo(
    this._scannerService,
  );
  @override
  Future<Either<Failure, String>> scan() => _scannerService.scan();
}
