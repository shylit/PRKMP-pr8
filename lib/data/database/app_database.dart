
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'social_networks.dart';

import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [SocialNetworks])
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
    driftDatabase(name: 'social_networks_db'),
  );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await batch((batch) {
        batch.insertAll(
          socialNetworks,
          [
            SocialNetworksCompanion.insert(
              title: 'VK',
              description:
              'Социальная сеть для общения и обмена контентом',
              imagePath: 'assets/images/vk.png',
            ),
            SocialNetworksCompanion.insert(
              title: 'Telegram',
              description:
              'Мессенджер для обмена сообщениями',
              imagePath: 'assets/images/telegram.png',
            ),
            SocialNetworksCompanion.insert(
              title: 'Instagram',
              description:
              'Социальная сеть для публикации фото и видео',
              imagePath: 'assets/images/instagram.png',
            ),
            SocialNetworksCompanion.insert(
              title: 'TikTok',
              description:
              'Платформа для просмотра коротких видео',
              imagePath: 'assets/images/tiktok.png',
            ),
            SocialNetworksCompanion.insert(
              title: 'YouTube',
              description:
              'Видеохостинг для просмотра и публикации видео',
              imagePath: 'assets/images/youtube.png',
            ),
          ],
        );
      });
    },
    onUpgrade: (m, from, to) async {
      // Миграции для будущих версий базы данных.
    },
  );
}
