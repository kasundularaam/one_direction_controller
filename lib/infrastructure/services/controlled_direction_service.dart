import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:one_direction_controller/core/extensions/dartz_x.dart';
import 'package:one_direction_controller/domain/controlled_direction/controlled_direction.dart';
import 'package:one_direction_controller/domain/failure/failure.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

@lazySingleton
class ControlledDirectionService {
  final StreamController<bool> _connectionStreamController =
      StreamController.broadcast()..add(false);

  Option<IO.Socket> _socketOption = const None();

  bool _isConnected = false;

  bool get isConnected => _isConnected;

  void init(String address) {
    final IO.Socket io = IO.io("$address/controller", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socketOption = Some(io.connect());

    final socket = _socketOption.getOrCrash();

    socket.on("connect_error", (error) {
      log(error.toString());
    });

    socket.onConnect((_) {
      _connectionStreamController.add(true);
    });
    socket.onDisconnect((_) {
      _connectionStreamController.add(false);
    });
    _updateConnectionState();
  }

  void _updateConnectionState() {
    watchConnection().listen((status) {
      _isConnected = status;
    });
  }

  Stream<bool> watchConnection() {
    return _connectionStreamController.stream;
  }

  Either<Failure, Unit> turn(ControlledDirection direction) {
    if (_socketOption.isNone()) {
      return const Left(Failure("Not connection not initiated"));
    }

    if (!isConnected) {
      return const Left(Failure("Not connected to the server"));
    }

    final socket = _socketOption.getOrCrash();

    socket.emit("direction", direction.direction.name);

    return const Right(unit);
  }

  void dispose() {
    _connectionStreamController.close();
  }
}
