// These imports are necessary to open the sqlite3 database
import 'package:drift/drift.dart';
import 'connection/connection.dart' as impl;

part 'database.g.dart';

// ... the TodoItems table definition stays the same
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
}

@DriftDatabase(tables: [TodoItems])
class Database extends _$Database {
  Database() : super(impl.connect());

  Database.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;
}
