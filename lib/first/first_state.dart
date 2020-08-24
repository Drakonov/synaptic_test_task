part of 'first_bloc.dart';

@immutable
abstract class FirstState {}

class FirstInitial extends FirstState {}

class FirstLoading extends FirstState{
  final List<ItemUser> items;

  FirstLoading(this.items);
}

class FirstLoaded extends FirstState{
  final List<ItemUser> items;

  FirstLoaded(this.items);
}

class FirstReturned extends FirstState{
  final List<ItemUser> items;

  FirstReturned(this.items);
}