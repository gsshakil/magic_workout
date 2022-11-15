// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'domain/entities/workout_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(4, 7353159368762086994),
      name: 'WorkoutEntity',
      lastPropertyId: const IdUid(5, 5480553038980418885),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8560785489312352200),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5606073488531345239),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2695420692620141972),
            name: 'exercise',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8341149442342003367),
            name: 'weight',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5480553038980418885),
            name: 'stepCount',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 7353159368762086994),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        6508109432572094522,
        8818139351344969541,
        3368765586294355264
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1333420436364806741,
        6301324555515506844,
        2196917635685448135,
        3643269137030748723,
        7603373363321368191,
        2071262709779056117,
        836646969739021966,
        1612013969038025241
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    WorkoutEntity: EntityDefinition<WorkoutEntity>(
        model: _entities[0],
        toOneRelations: (WorkoutEntity object) => [],
        toManyRelations: (WorkoutEntity object) => {},
        getId: (WorkoutEntity object) => object.id,
        setId: (WorkoutEntity object, int id) {
          object.id = id;
        },
        objectToFB: (WorkoutEntity object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final exerciseOffset = object.exercise == null
              ? null
              : fbb.writeString(object.exercise!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, exerciseOffset);
          fbb.addFloat64(3, object.weight);
          fbb.addInt64(4, object.stepCount);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = WorkoutEntity(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              exercise: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              weight: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              stepCount: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 12));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [WorkoutEntity] entity fields to define ObjectBox queries.
class WorkoutEntity_ {
  /// see [WorkoutEntity.id]
  static final id =
      QueryIntegerProperty<WorkoutEntity>(_entities[0].properties[0]);

  /// see [WorkoutEntity.title]
  static final title =
      QueryStringProperty<WorkoutEntity>(_entities[0].properties[1]);

  /// see [WorkoutEntity.exercise]
  static final exercise =
      QueryStringProperty<WorkoutEntity>(_entities[0].properties[2]);

  /// see [WorkoutEntity.weight]
  static final weight =
      QueryDoubleProperty<WorkoutEntity>(_entities[0].properties[3]);

  /// see [WorkoutEntity.stepCount]
  static final stepCount =
      QueryIntegerProperty<WorkoutEntity>(_entities[0].properties[4]);
}
