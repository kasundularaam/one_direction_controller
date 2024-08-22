// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:one_direction_controller/application/connect/connect_cubit.dart'
    as _i179;
import 'package:one_direction_controller/application/connection/connection_cubit.dart'
    as _i228;
import 'package:one_direction_controller/application/control_direction/control_direction_cubit.dart'
    as _i209;
import 'package:one_direction_controller/domain/controlled_direction/i_controlled_direction_repo.dart'
    as _i63;
import 'package:one_direction_controller/domain/scanner/i_scanner_repo.dart'
    as _i895;
import 'package:one_direction_controller/infrastructure/repo/controlled_direction_repo.dart'
    as _i31;
import 'package:one_direction_controller/infrastructure/repo/scanner_repo.dart'
    as _i270;
import 'package:one_direction_controller/infrastructure/services/controlled_direction_service.dart'
    as _i641;
import 'package:one_direction_controller/infrastructure/services/scanner_service.dart'
    as _i342;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i641.ControlledDirectionService>(
        () => _i641.ControlledDirectionService());
    gh.lazySingleton<_i342.ScannerService>(() => _i342.ScannerService());
    gh.lazySingleton<_i63.IControlledDirectionRepo>(() =>
        _i31.ControlledDirectionRepo(gh<_i641.ControlledDirectionService>()));
    gh.lazySingleton<_i895.IScannerRepo>(
        () => _i270.ScannerRepo(gh<_i342.ScannerService>()));
    gh.factory<_i179.ConnectCubit>(() => _i179.ConnectCubit(
          gh<_i63.IControlledDirectionRepo>(),
          gh<_i895.IScannerRepo>(),
        ));
    gh.factory<_i228.ConnectionCubit>(
        () => _i228.ConnectionCubit(gh<_i63.IControlledDirectionRepo>()));
    gh.factory<_i209.ControlDirectionCubit>(
        () => _i209.ControlDirectionCubit(gh<_i63.IControlledDirectionRepo>()));
    return this;
  }
}
