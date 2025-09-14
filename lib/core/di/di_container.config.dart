// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:imdb_clone/core/dio/dio_module.dart' as _i691;
import 'package:imdb_clone/data/local/local_module.dart' as _i91;
import 'package:imdb_clone/data/local/token_storage.dart' as _i637;
import 'package:imdb_clone/data/remote/movie_api.dart' as _i468;
import 'package:imdb_clone/data/repositories/movie_repository_impl.dart'
    as _i530;
import 'package:imdb_clone/data/repositories/token_repository_impl.dart'
    as _i666;
import 'package:imdb_clone/domain/repositories/movie_repository.dart' as _i809;
import 'package:imdb_clone/domain/repositories/token_repository.dart' as _i732;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final localModule = _$LocalModule();
    final dioModule = _$DioModule();
    gh.singletonAsync<_i558.FlutterSecureStorage>(
        () => localModule.createSecureStorage());
    gh.singleton<_i361.Dio>(
      () => dioModule.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.factoryAsync<_i637.TokenStorage>(() async =>
        _i637.TokenStorage(await getAsync<_i558.FlutterSecureStorage>()));
    gh.singleton<_i468.MovieApi>(() => _i468.MovieApi(gh<InvalidType>()));
    gh.singletonAsync<_i732.TokenRepository>(() async =>
        _i666.TokenRepositoryImpl(await getAsync<_i637.TokenStorage>()));
    gh.singleton<_i809.MovieRepository>(
        () => _i530.MovieRepositoryImpl(gh<_i468.MovieApi>()));
    gh.singletonAsync<_i361.Dio>(() async => dioModule
        .getAuthorizedDioClient(await getAsync<_i732.TokenRepository>()));
    return this;
  }
}

class _$LocalModule extends _i91.LocalModule {}

class _$DioModule extends _i691.DioModule {}
