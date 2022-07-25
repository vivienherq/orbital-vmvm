import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projects_record.g.dart';

abstract class ProjectsRecord
    implements Built<ProjectsRecord, ProjectsRecordBuilder> {
  static Serializer<ProjectsRecord> get serializer =>
      _$projectsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'project_name')
  String get projectName;

  @nullable
  @BuiltValueField(wireName: 'creator_email')
  String get creatorEmail;

  @nullable
  DateTime get deadline;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'is_done')
  bool get isDone;

  @nullable
  @BuiltValueField(wireName: 'is_deleted')
  bool get isDeleted;

  @nullable
  @BuiltValueField(wireName: 'shared_with')
  BuiltList<String> get sharedWith;

  @nullable
  @BuiltValueField(wireName: 'project_id')
  String get projectId;

  @nullable
  @BuiltValueField(wireName: 'telegram_id')
  int get telegramId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProjectsRecordBuilder builder) => builder
    ..projectName = ''
    ..creatorEmail = ''
    ..description = ''
    ..isDone = false
    ..isDeleted = false
    ..sharedWith = ListBuilder()
    ..projectId = ''
    ..telegramId = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProjectsRecord._();
  factory ProjectsRecord([void Function(ProjectsRecordBuilder) updates]) =
      _$ProjectsRecord;

  static ProjectsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProjectsRecordData({
  String projectName,
  String creatorEmail,
  DateTime deadline,
  String description,
  bool isDone,
  bool isDeleted,
  String projectId,
  int telegramId,
}) =>
    serializers.toFirestore(
        ProjectsRecord.serializer,
        ProjectsRecord((p) => p
          ..projectName = projectName
          ..creatorEmail = creatorEmail
          ..deadline = deadline
          ..description = description
          ..isDone = isDone
          ..isDeleted = isDeleted
          ..sharedWith = null
          ..projectId = projectId
          ..telegramId = telegramId));
