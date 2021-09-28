part of 'all_service_bloc.dart';

@immutable
abstract class AllServiceState {
  const AllServiceState();
}

class InitialAllServiceState extends AllServiceState {}

class LoadingAllServiceState extends AllServiceState {}

class LoadedAllServiceState extends AllServiceState {
  final List<AllService> allServiceList;

  const LoadedAllServiceState(@required this.allServiceList);
}

class ErrorAllServiceState extends AllServiceState {}