import 'package:get_it/get_it.dart';
import 'package:localdbchecker/data/datasources/local/database/database.dart';

GetIt locator = GetIt.instance;

Database dbService = locator<Database>();

Future setupLocator() async {
  locator.registerSingleton(Database());
}
