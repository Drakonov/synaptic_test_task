part of 'second_bloc.dart';

@immutable
abstract class SecondState {}

class SecondInitial extends SecondState {}

class SecondLoaded extends SecondState {
  final ItemPost item;

  SecondLoaded(this.item);
}

class SecondDeleted extends SecondState{}

class SecondModify extends SecondState{
  final ItemPost item;

  SecondModify(this.item);
}