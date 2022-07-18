import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'event_name')
  String get eventName;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  String get createdBy;

  @nullable
  @BuiltValueField(wireName: 'from_date')
  DateTime get fromDate;

  @nullable
  @BuiltValueField(wireName: 'to_date')
  DateTime get toDate;

  @nullable
  @BuiltValueField(wireName: 'is_done')
  bool get isDone;

  @nullable
  @BuiltValueField(wireName: 'is_deleted')
  bool get isDeleted;

  @nullable
  @BuiltValueField(wireName: 'event_date')
  DateTime get eventDate;

  @nullable
  @BuiltValueField(wireName: 'start_time')
  DateTime get startTime;

  @nullable
  @BuiltValueField(wireName: 'end_time')
  DateTime get endTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..eventName = ''
    ..description = ''
    ..createdBy = ''
    ..isDone = false
    ..isDeleted = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
      _$EventsRecord;

  static EventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEventsRecordData({
  String eventName,
  String description,
  String createdBy,
  DateTime fromDate,
  DateTime toDate,
  bool isDone,
  bool isDeleted,
  DateTime eventDate,
  DateTime startTime,
  DateTime endTime,
}) =>
    serializers.toFirestore(
        EventsRecord.serializer,
        EventsRecord((e) => e
          ..eventName = eventName
          ..description = description
          ..createdBy = createdBy
          ..fromDate = fromDate
          ..toDate = toDate
          ..isDone = isDone
          ..isDeleted = isDeleted
          ..eventDate = eventDate
          ..startTime = startTime
          ..endTime = endTime));
