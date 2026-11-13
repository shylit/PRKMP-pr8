// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SocialNetworksTable extends SocialNetworks
    with TableInfo<$SocialNetworksTable, SocialNetwork> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SocialNetworksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'social_networks';
  @override
  VerificationContext validateIntegrity(
    Insertable<SocialNetwork> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SocialNetwork map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SocialNetwork(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
    );
  }

  @override
  $SocialNetworksTable createAlias(String alias) {
    return $SocialNetworksTable(attachedDatabase, alias);
  }
}

class SocialNetwork extends DataClass implements Insertable<SocialNetwork> {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  const SocialNetwork({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  SocialNetworksCompanion toCompanion(bool nullToAbsent) {
    return SocialNetworksCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      imagePath: Value(imagePath),
    );
  }

  factory SocialNetwork.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SocialNetwork(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  SocialNetwork copyWith({
    int? id,
    String? title,
    String? description,
    String? imagePath,
  }) => SocialNetwork(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    imagePath: imagePath ?? this.imagePath,
  );
  SocialNetwork copyWithCompanion(SocialNetworksCompanion data) {
    return SocialNetwork(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SocialNetwork(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocialNetwork &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.imagePath == this.imagePath);
}

class SocialNetworksCompanion extends UpdateCompanion<SocialNetwork> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> imagePath;
  const SocialNetworksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  SocialNetworksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String imagePath,
  }) : title = Value(title),
       description = Value(description),
       imagePath = Value(imagePath);
  static Insertable<SocialNetwork> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  SocialNetworksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? imagePath,
  }) {
    return SocialNetworksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SocialNetworksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SocialNetworksTable socialNetworks = $SocialNetworksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [socialNetworks];
}

typedef $$SocialNetworksTableCreateCompanionBuilder =
    SocialNetworksCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String imagePath,
    });
typedef $$SocialNetworksTableUpdateCompanionBuilder =
    SocialNetworksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> imagePath,
    });

class $$SocialNetworksTableFilterComposer
    extends Composer<_$AppDatabase, $SocialNetworksTable> {
  $$SocialNetworksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SocialNetworksTableOrderingComposer
    extends Composer<_$AppDatabase, $SocialNetworksTable> {
  $$SocialNetworksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SocialNetworksTableAnnotationComposer
    extends Composer<_$AppDatabase, $SocialNetworksTable> {
  $$SocialNetworksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);
}

class $$SocialNetworksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SocialNetworksTable,
          SocialNetwork,
          $$SocialNetworksTableFilterComposer,
          $$SocialNetworksTableOrderingComposer,
          $$SocialNetworksTableAnnotationComposer,
          $$SocialNetworksTableCreateCompanionBuilder,
          $$SocialNetworksTableUpdateCompanionBuilder,
          (
            SocialNetwork,
            BaseReferences<_$AppDatabase, $SocialNetworksTable, SocialNetwork>,
          ),
          SocialNetwork,
          PrefetchHooks Function()
        > {
  $$SocialNetworksTableTableManager(
    _$AppDatabase db,
    $SocialNetworksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SocialNetworksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SocialNetworksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SocialNetworksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
              }) => SocialNetworksCompanion(
                id: id,
                title: title,
                description: description,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String imagePath,
              }) => SocialNetworksCompanion.insert(
                id: id,
                title: title,
                description: description,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SocialNetworksTable, SocialNetwork>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SocialNetworksTable,
                    SocialNetwork
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SocialNetworksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SocialNetworksTable,
      SocialNetwork,
      $$SocialNetworksTableFilterComposer,
      $$SocialNetworksTableOrderingComposer,
      $$SocialNetworksTableAnnotationComposer,
      $$SocialNetworksTableCreateCompanionBuilder,
      $$SocialNetworksTableUpdateCompanionBuilder,
      (
        SocialNetwork,
        BaseReferences<_$AppDatabase, $SocialNetworksTable, SocialNetwork>,
      ),
      SocialNetwork,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SocialNetworksTableTableManager get socialNetworks =>
      $$SocialNetworksTableTableManager(_db, _db.socialNetworks);
}
