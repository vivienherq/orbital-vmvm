// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectsRecord> _$projectsRecordSerializer =
    new _$ProjectsRecordSerializer();

class _$ProjectsRecordSerializer
    implements StructuredSerializer<ProjectsRecord> {
  @override
  final Iterable<Type> types = const [ProjectsRecord, _$ProjectsRecord];
  @override
  final String wireName = 'ProjectsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProjectsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.projectName;
    if (value != null) {
      result
        ..add('project_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creatorEmail;
    if (value != null) {
      result
        ..add('creator_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deadline;
    if (value != null) {
      result
        ..add('deadline')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.sharedWith;
    if (value != null) {
      result
        ..add('shared_with')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.projectId;
    if (value != null) {
      result
        ..add('project_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  ProjectsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'project_name':
          result.projectName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creator_email':
          result.creatorEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deadline':
          result.deadline = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_done':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'shared_with':
          result.sharedWith.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'project_id':
          result.projectId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ProjectsRecord extends ProjectsRecord {
  @override
  final String projectName;
  @override
  final String creatorEmail;
  @override
  final DateTime deadline;
  @override
  final String description;
  @override
  final bool isDone;
  @override
  final bool isDeleted;
  @override
  final BuiltList<String> sharedWith;
  @override
  final String projectId;
  @override
  final DocumentReference<Object> reference;

  factory _$ProjectsRecord([void Function(ProjectsRecordBuilder) updates]) =>
      (new ProjectsRecordBuilder()..update(updates)).build();

  _$ProjectsRecord._(
      {this.projectName,
      this.creatorEmail,
      this.deadline,
      this.description,
      this.isDone,
      this.isDeleted,
      this.sharedWith,
      this.projectId,
      this.reference})
      : super._();

  @override
  ProjectsRecord rebuild(void Function(ProjectsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectsRecordBuilder toBuilder() =>
      new ProjectsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectsRecord &&
        projectName == other.projectName &&
        creatorEmail == other.creatorEmail &&
        deadline == other.deadline &&
        description == other.description &&
        isDone == other.isDone &&
        isDeleted == other.isDeleted &&
        sharedWith == other.sharedWith &&
        projectId == other.projectId &&
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
                                $jc($jc(0, projectName.hashCode),
                                    creatorEmail.hashCode),
                                deadline.hashCode),
                            description.hashCode),
                        isDone.hashCode),
                    isDeleted.hashCode),
                sharedWith.hashCode),
            projectId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProjectsRecord')
          ..add('projectName', projectName)
          ..add('creatorEmail', creatorEmail)
          ..add('deadline', deadline)
          ..add('description', description)
          ..add('isDone', isDone)
          ..add('isDeleted', isDeleted)
          ..add('sharedWith', sharedWith)
          ..add('projectId', projectId)
          ..add('reference', reference))
        .toString();
  }
}

class ProjectsRecordBuilder
    implements Builder<ProjectsRecord, ProjectsRecordBuilder> {
  _$ProjectsRecord _$v;

  String _projectName;
  String get projectName => _$this._projectName;
  set projectName(String projectName) => _$this._projectName = projectName;

  String _creatorEmail;
  String get creatorEmail => _$this._creatorEmail;
  set creatorEmail(String creatorEmail) => _$this._creatorEmail = creatorEmail;

  DateTime _deadline;
  DateTime get deadline => _$this._deadline;
  set deadline(DateTime deadline) => _$this._deadline = deadline;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _isDone;
  bool get isDone => _$this._isDone;
  set isDone(bool isDone) => _$this._isDone = isDone;

  bool _isDeleted;
  bool get isDeleted => _$this._isDeleted;
  set isDeleted(bool isDeleted) => _$this._isDeleted = isDeleted;

  ListBuilder<String> _sharedWith;
  ListBuilder<String> get sharedWith =>
      _$this._sharedWith ??= new ListBuilder<String>();
  set sharedWith(ListBuilder<String> sharedWith) =>
      _$this._sharedWith = sharedWith;

  String _projectId;
  String get projectId => _$this._projectId;
  set projectId(String projectId) => _$this._projectId = projectId;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProjectsRecordBuilder() {
    ProjectsRecord._initializeBuilder(this);
  }

  ProjectsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectName = $v.projectName;
      _creatorEmail = $v.creatorEmail;
      _deadline = $v.deadline;
      _description = $v.description;
      _isDone = $v.isDone;
      _isDeleted = $v.isDeleted;
      _sharedWith = $v.sharedWith?.toBuilder();
      _projectId = $v.projectId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectsRecord;
  }

  @override
  void update(void Function(ProjectsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProjectsRecord build() {
    _$ProjectsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProjectsRecord._(
              projectName: projectName,
              creatorEmail: creatorEmail,
              deadline: deadline,
              description: description,
              isDone: isDone,
              isDeleted: isDeleted,
              sharedWith: _sharedWith?.build(),
              projectId: projectId,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sharedWith';
        _sharedWith?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProjectsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
