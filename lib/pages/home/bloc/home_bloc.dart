
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../models/social_network.dart';
import '../../../data/social_network_repository.dart';


part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SocialNetworkRepository repository;

  HomeBloc(this.repository) : super(const HomeInitial()) {
    on<LoadSocialNetworksEvent>(_onLoadSocialNetworks);
  }

  Future<void> _onLoadSocialNetworks(
      LoadSocialNetworksEvent event,
      Emitter<HomeState> emit,
      ) async {
    emit(const HomeLoading());

    try {
      final networks = await repository.getNetworks();


      emit(HomeLoaded(networks));
    } catch (e) {
      emit(const HomeError(
        'Не удалось загрузить социальные сети',
      ));
    }
  }
}
