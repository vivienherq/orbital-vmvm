import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasks_record.g.dart';

abstract class TasksRecord implements Built<TasksRecord, TasksRecordBuilder> {
  static Serializer<TasksRecord> get serializer => _$tasksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'task_name')
  String get taskName;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'assigned_to')
  String get assignedTo;

  @nullable
  @BuiltValueField(wireName: 'is_deleted')
  bool get isDeleted;

  @nullable
  @BuiltValueField(wireName: 'is_done')
  bool get isDone;

  @nullable
  @BuiltValueField(wireName: 'project_name')
  String get projectName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TasksRecordBuilder builder) => builder
    ..taskName = ''
    ..description = ''
    ..assignedTo = ''
    ..isDeleted = false
    ..isDone = false
    ..projectName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TasksRecord._();
  factory TasksRecord([void Function(TasksRecordBuilder) updates]) =
      _$TasksRecord;

  static TasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTasksRecordData({
  String taskName,
  String description,
  String assignedTo,
  bool isDeleted,
  bool isDone,
  String projectName,
}) =>
    serializers.toFirestore(
        TasksRecord.serializer,
        TasksRecord((t) => t
          ..taskName = taskName
          ..description = description
          ..assignedTo = assignedTo
          ..isDeleted = isDeleted
          ..isDone = isDone
          ..projectName = projectName));
