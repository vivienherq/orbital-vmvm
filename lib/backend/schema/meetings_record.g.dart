// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MeetingsRecord> _$meetingsRecordSerializer =
    new _$MeetingsRecordSerializer();

class _$MeetingsRecordSerializer
    implements StructuredSerializer<MeetingsRecord> {
  @override
  final Iterable<Type> types = const [MeetingsRecord, _$MeetingsRecord];
  @override
  final String wireName = 'MeetingsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MeetingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.meetingName;
    if (value != null) {
      result
        ..add('meeting_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.meetingDate;
    if (value != null) {
      result
        ..add('meeting_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('end_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.projectId;
    if (value != null) {
      result
        ..add('project_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  MeetingsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MeetingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'meeting_name':
          result.meetingName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'meeting_date':
          result.meetingDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'project_id':
          result.projectId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$MeetingsRecord extends MeetingsRecord {
  @override
  final String meetingName;
  @override
  final String description;
  @override
  final DateTime meetingDate;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String projectId;
  @override
  final bool isDeleted;
  @override
  final DocumentReference<Object> reference;

  factory _$MeetingsRecord([void Function(MeetingsRecordBuilder) updates]) =>
      (new MeetingsRecordBuilder()..update(updates)).build();

  _$MeetingsRecord._(
      {this.meetingName,
      this.description,
      this.meetingDate,
      this.startTime,
      this.endTime,
      this.projectId,
      this.isDeleted,
      this.reference})
      : super._();

  @override
  MeetingsRecord rebuild(void Function(MeetingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeetingsRecordBuilder toBuilder() =>
      new MeetingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeetingsRecord &&
        meetingName == other.meetingName &&
        description == other.description &&
        meetingDate == other.meetingDate &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        projectId == other.projectId &&
        isDeleted == other.isDeleted &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, meetingName.hashCode),
                                description.hashCode),
                            meetingDate.hashCode),
                        startTime.hashCode),
                    endTime.hashCode),
                projectId.hashCode),
            isDeleted.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MeetingsRecord')
          ..add('meetingName', meetingName)
          ..add('description', description)
          ..add('meetingDate', meetingDate)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('projectId', projectId)
          ..add('isDeleted', isDeleted)
          ..add('reference', reference))
        .toString();
  }
}

class MeetingsRecordBuilder
    implements Builder<MeetingsRecord, MeetingsRecordBuilder> {
  _$MeetingsRecord _$v;

  String _meetingName;
  String get meetingName => _$this._meetingName;
  set meetingName(String meetingName) => _$this._meetingName = meetingName;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DateTime _meetingDate;
  DateTime get meetingDate => _$this._meetingDate;
  set meetingDate(DateTime meetingDate) => _$this._meetingDate = meetingDate;

  DateTime _startTime;
  DateTime get startTime => _$this._startTime;
  set startTime(DateTime startTime) => _$this._startTime = startTime;

  DateTime _endTime;
  DateTime get endTime => _$this._endTime;
  set endTime(DateTime endTime) => _$this._endTime = endTime;

  String _projectId;
  String get projectId => _$this._projectId;
  set projectId(String projectId) => _$this._projectId = projectId;

  bool _isDeleted;
  bool get isDeleted => _$this._isDeleted;
  set isDeleted(bool isDeleted) => _$this._isDeleted = isDeleted;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MeetingsRecordBuilder() {
    MeetingsRecord._initializeBuilder(this);
  }

  MeetingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meetingName = $v.meetingName;
      _description = $v.description;
      _meetingDate = $v.meetingDate;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _projectId = $v.projectId;
      _isDeleted = $v.isDeleted;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeetingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeetingsRecord;
  }

  @override
  void update(void Function(MeetingsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MeetingsRecord build() {
    final _$result = _$v ??
        new _$MeetingsRecord._(
            meetingName: meetingName,
            description: description,
            meetingDate: meetingDate,
            startTime: startTime,
            endTime: endTime,
            projectId: projectId,
            isDeleted: isDeleted,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
