part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class AppWelcome extends AppState {
  @override
  List<Object> get props => [];
}

class AppLoading extends AppState {
  @override
  List<Object> get props => [];
}

class AppLoaded extends AppState {
  const AppLoaded(this.places);
  final List<DataModel> places;

  @override
  List<Object> get props => [places];
}

class AppDetail extends AppState {
  const AppDetail(this.place);
  final DataModel place;

  @override
  List<Object> get props => [place];
}
