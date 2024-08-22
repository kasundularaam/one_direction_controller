import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one_direction_controller/domain/controlled_direction/enum.dart';
part 'controlled_direction.freezed.dart';
part 'controlled_direction.g.dart';

@freezed
abstract class ControlledDirection with _$ControlledDirection {
  const ControlledDirection._();
  const factory ControlledDirection({required Direction direction}) =
      _ControlledDirection;
  factory ControlledDirection.fromJson(Map<String, Object?> json) =>
      _$ControlledDirectionFromJson(json);
}
