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
  final String id;
  final String title;
  final String body;

  SecondModify(this.item, this.id, this.title, this.body);

}