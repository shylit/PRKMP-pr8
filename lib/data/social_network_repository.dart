import 'package:drift/drift.dart';

import '../models/social_network.dart';
import 'database/app_database.dart' hide SocialNetwork;

import 'package:injectable/injectable.dart';

@lazySingleton
class SocialNetworkRepository {
  final AppDatabase _database;

  SocialNetworkRepository(this._database);

  // READ — получение всех социальных сетей
  Future<List<SocialNetwork>> getNetworks() async {
    final rows = await _database
        .select(_database.socialNetworks)
        .get();

    return rows.map((row) {
      return SocialNetwork(
        title: row.title,
        description: row.description,
        imagePath: row.imagePath,
      );
    }).toList();
  }

  // CREATE — добавление социальной сети
  Future<int> addNetwork(SocialNetwork network) {
    return _database.into(_database.socialNetworks).insert(
      SocialNetworksCompanion.insert(
        title: network.title,
        description: network.description,
        imagePath: network.imagePath,
      ),
    );
  }

  // UPDATE — обновление социальной сети по id
  Future<int> updateNetwork(
      int id,
      SocialNetwork network,
      ) {
    return (_database.update(_database.socialNetworks)
      ..where((table) => table.id.equals(id)))
        .write(
      SocialNetworksCompanion(
        title: Value(network.title),
        description: Value(network.description),
        imagePath: Value(network.imagePath),
      ),
    );
  }

  // DELETE — удаление социальной сети по id
  Future<int> deleteNetwork(int id) {
    return (_database.delete(_database.socialNetworks)
      ..where((table) => table.id.equals(id)))
        .go();
  }
}
