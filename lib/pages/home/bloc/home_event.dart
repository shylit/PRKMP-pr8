part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class LoadSocialNetworksEvent extends HomeEvent {
  const LoadSocialNetworksEvent();
}