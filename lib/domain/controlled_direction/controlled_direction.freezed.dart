// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'controlled_direction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ControlledDirection _$ControlledDirectionFromJson(Map<String, dynamic> json) {
  return _ControlledDirection.fromJson(json);
}

/// @nodoc
mixin _$ControlledDirection {
  Direction get direction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ControlledDirectionCopyWith<ControlledDirection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlledDirectionCopyWith<$Res> {
  factory $ControlledDirectionCopyWith(
          ControlledDirection value, $Res Function(ControlledDirection) then) =
      _$ControlledDirectionCopyWithImpl<$Res, ControlledDirection>;
  @useResult
  $Res call({Direction direction});
}

/// @nodoc
class _$ControlledDirectionCopyWithImpl<$Res, $Val extends ControlledDirection>
    implements $ControlledDirectionCopyWith<$Res> {
  _$ControlledDirectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControlledDirectionImplCopyWith<$Res>
    implements $ControlledDirectionCopyWith<$Res> {
  factory _$$ControlledDirectionImplCopyWith(_$ControlledDirectionImpl value,
          $Res Function(_$ControlledDirectionImpl) then) =
      __$$ControlledDirectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Direction direction});
}

/// @nodoc
class __$$ControlledDirectionImplCopyWithImpl<$Res>
    extends _$ControlledDirectionCopyWithImpl<$Res, _$ControlledDirectionImpl>
    implements _$$ControlledDirectionImplCopyWith<$Res> {
  __$$ControlledDirectionImplCopyWithImpl(_$ControlledDirectionImpl _value,
      $Res Function(_$ControlledDirectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_$ControlledDirectionImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ControlledDirectionImpl extends _ControlledDirection {
  const _$ControlledDirectionImpl({required this.direction}) : super._();

  factory _$ControlledDirectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ControlledDirectionImplFromJson(json);

  @override
  final Direction direction;

  @override
  String toString() {
    return 'ControlledDirection(direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControlledDirectionImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControlledDirectionImplCopyWith<_$ControlledDirectionImpl> get copyWith =>
      __$$ControlledDirectionImplCopyWithImpl<_$ControlledDirectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ControlledDirectionImplToJson(
      this,
    );
  }
}

abstract class _ControlledDirection extends ControlledDirection {
  const factory _ControlledDirection({required final Direction direction}) =
      _$ControlledDirectionImpl;
  const _ControlledDirection._() : super._();

  factory _ControlledDirection.fromJson(Map<String, dynamic> json) =
      _$ControlledDirectionImpl.fromJson;

  @override
  Direction get direction;
  @override
  @JsonKey(ignore: true)
  _$$ControlledDirectionImplCopyWith<_$ControlledDirectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
