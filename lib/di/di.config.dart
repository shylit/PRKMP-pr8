// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:social_media_project/data/database/app_database.dart' as _i305;
import 'package:social_media_project/data/social_network_repository.dart'
    as _i662;
import 'package:social_media_project/pages/home/bloc/home_bloc.dart' as _i931;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i305.AppDatabase>(() => _i305.AppDatabase());
    gh.lazySingleton<_i662.SocialNetworkRepository>(
      () => _i662.SocialNetworkRepository(gh<_i305.AppDatabase>()),
    );
    gh.factory<_i931.HomeBloc>(
      () => _i931.HomeBloc(gh<_i662.SocialNetworkRepository>()),
    );
    return this;
  }
}
