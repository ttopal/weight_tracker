import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'record.freezed.dart';

part 'record.g.dart';

@freezed
class Record with _$Record {

  factory Record({required DateTime dateTime, String? note, String? photoUrl, required int weight}) = _Record;

  factory Record.fromJson(Map<String, Object?> json)
  => _$RecordFromJson(json);
}
