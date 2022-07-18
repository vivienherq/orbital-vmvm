// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventsRecord> _$eventsRecordSerializer =
    new _$EventsRecordSerializer();

class _$EventsRecordSerializer implements StructuredSerializer<EventsRecord> {
  @override
  final Iterable<Type> types = const [EventsRecord, _$EventsRecord];
  @override
  final String wireName = 'EventsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, EventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.eventName;
    if (value != null) {
      result
        ..add('event_name')
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
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromDate;
    if (value != null) {
      result
        ..add('from_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.toDate;
    if (value != null) {
      result
        ..add('to_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('is_done')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.eventDate;
    if (value != null) {
      result
        ..add('event_date')
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
  EventsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'event_name':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'from_date':
          result.fromDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'to_date':
          result.toDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'is_done':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'event_date':
          result.eventDate = serializers.deserialize(value,
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

class _$EventsRecord extends EventsRecord {
  @override
  final String eventName;
  @override
  final String description;
  @override
  final String createdBy;
  @override
  final DateTime fromDate;
  @override
  final DateTime toDate;
  @override
  final bool isDone;
  @override
  final bool isDeleted;
  @override
  final DateTime eventDate;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final DocumentReference<Object> reference;

  factory _$EventsRecord([void Function(EventsRecordBuilder) updates]) =>
      (new EventsRecordBuilder()..update(updates)).build();

  _$EventsRecord._(
      {this.eventName,
      this.description,
      this.createdBy,
      this.fromDate,
      this.toDate,
      this.isDone,
      this.isDeleted,
      this.eventDate,
      this.startTime,
      this.endTime,
      this.reference})
      : super._();

  @override
  EventsRecord rebuild(void Function(EventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsRecordBuilder toBuilder() => new EventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsRecord &&
        eventName == other.eventName &&
        description == other.description &&
        createdBy == other.createdBy &&
        fromDate == other.fromDate &&
        toDate == other.toDate &&
        isDone == other.isDone &&
        isDeleted == other.isDeleted &&
        eventDate == other.eventDate &&
        startTime == other.startTime &&
        endTime == other.endTime &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, eventName.hashCode),
                                            description.hashCode),
                                        createdBy.hashCode),
                                    fromDate.hashCode),
                                toDate.hashCode),
                            isDone.hashCode),
                        isDeleted.hashCode),
                    eventDate.hashCode),
                startTime.hashCode),
            endTime.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventsRecord')
          ..add('eventName', eventName)
          ..add('description', description)
          ..add('createdBy', createdBy)
          ..add('fromDate', fromDate)
          ..add('toDate', toDate)
          ..add('isDone', isDone)
          ..add('isDeleted', isDeleted)
          ..add('eventDate', eventDate)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('reference', reference))
        .toString();
  }
}

class EventsRecordBuilder
    implements Builder<EventsRecord, EventsRecordBuilder> {
  _$EventsRecord _$v;

  String _eventName;
  String get eventName => _$this._eventName;
  set eventName(String eventName) => _$this._eventName = eventName;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _createdBy;
  String get createdBy => _$this._createdBy;
  set createdBy(String createdBy) => _$this._createdBy = createdBy;

  DateTime _fromDate;
  DateTime get fromDate => _$this._fromDate;
  set fromDate(DateTime fromDate) => _$this._fromDate = fromDate;

  DateTime _toDate;
  DateTime get toDate => _$this._toDate;
  set toDate(DateTime toDate) => _$this._toDate = toDate;

  bool _isDone;
  bool get isDone => _$this._isDone;
  set isDone(bool isDone) => _$this._isDone = isDone;

  bool _isDeleted;
  bool get isDeleted => _$this._isDeleted;
  set isDeleted(bool isDeleted) => _$this._isDeleted = isDeleted;

  DateTime _eventDate;
  DateTime get eventDate => _$this._eventDate;
  set eventDate(DateTime eventDate) => _$this._eventDate = eventDate;

  DateTime _startTime;
  DateTime get startTime => _$this._startTime;
  set startTime(DateTime startTime) => _$this._startTime = startTime;

  DateTime _endTime;
  DateTime get endTime => _$this._endTime;
  set endTime(DateTime endTime) => _$this._endTime = endTime;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EventsRecordBuilder() {
    EventsRecord._initializeBuilder(this);
  }

  EventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventName = $v.eventName;
      _description = $v.description;
      _createdBy = $v.createdBy;
      _fromDate = $v.fromDate;
      _toDate = $v.toDate;
      _isDone = $v.isDone;
      _isDeleted = $v.isDeleted;
      _eventDate = $v.eventDate;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsRecord;
  }

  @override
  void update(void Function(EventsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventsRecord build() {
    final _$result = _$v ??
        new _$EventsRecord._(
            eventName: eventName,
            description: description,
            createdBy: createdBy,
            fromDate: fromDate,
            toDate: toDate,
            isDone: isDone,
            isDeleted: isDeleted,
            eventDate: eventDate,
            startTime: startTime,
            endTime: endTime,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
