import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:injectable/injectable.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';

@lazySingleton
class ScannerService {
  final _urlRegex = RegExp(
      r'^(https?:\/\/)?([\w-]+(\.[\w-]+)+)([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?$');
  Future<Either<Failure, String>> scan() async {
    try {
      final address = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!_urlRegex.hasMatch(address)) {
        return const Left(Failure("Not a valid address"));
      }
      return Right(address);
    } catch (e) {
      return const Left(Failure("Failed to scan"));
    }
  }
}
