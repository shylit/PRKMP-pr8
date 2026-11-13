part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  final List<SocialNetwork> socialNetworks;

  const HomeLoaded(this.socialNetworks);
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}