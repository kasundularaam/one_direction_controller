// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controlled_direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ControlledDirectionImpl _$$ControlledDirectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ControlledDirectionImpl(
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
    );

Map<String, dynamic> _$$ControlledDirectionImplToJson(
        _$ControlledDirectionImpl instance) =>
    <String, dynamic>{
      'direction': _$DirectionEnumMap[instance.direction]!,
    };

const _$DirectionEnumMap = {
  Direction.left: 'left',
  Direction.right: 'right',
  Direction.forward: 'forward',
  Direction.backward: 'backward',
  Direction.stop: 'stop',
};
