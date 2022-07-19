import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meetings_record.g.dart';

abstract class MeetingsRecord
    implements Built<MeetingsRecord, MeetingsRecordBuilder> {
  static Serializer<MeetingsRecord> get serializer =>
      _$meetingsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'meeting_name')
  String get meetingName;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'meeting_date')
  DateTime get meetingDate;

  @nullable
  @BuiltValueField(wireName: 'start_time')
  DateTime get startTime;

  @nullable
  @BuiltValueField(wireName: 'end_time')
  DateTime get endTime;

  @nullable
  @BuiltValueField(wireName: 'project_id')
  String get projectId;

  @nullable
  @BuiltValueField(wireName: 'is_deleted')
  bool get isDeleted;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MeetingsRecordBuilder builder) => builder
    ..meetingName = ''
    ..description = ''
    ..projectId = ''
    ..isDeleted = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Meetings');

  static Stream<MeetingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MeetingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeetingsRecord._();
  factory MeetingsRecord([void Function(MeetingsRecordBuilder) updates]) =
      _$MeetingsRecord;

  static MeetingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeetingsRecordData({
  String meetingName,
  String description,
  DateTime meetingDate,
  DateTime startTime,
  DateTime endTime,
  String projectId,
  bool isDeleted,
}) =>
    serializers.toFirestore(
        MeetingsRecord.serializer,
        MeetingsRecord((m) => m
          ..meetingName = meetingName
          ..description = description
          ..meetingDate = meetingDate
          ..startTime = startTime
          ..endTime = endTime
          ..projectId = projectId
          ..isDeleted = isDeleted));
