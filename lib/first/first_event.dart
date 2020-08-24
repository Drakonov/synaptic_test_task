part of 'first_bloc.dart';

@immutable
abstract class FirstEvent {}

class InitialFirst extends FirstEvent{}

class AddFirst extends FirstEvent{}

class ReturnAndDeleteSecond extends FirstEvent{
  final int id;

  ReturnAndDeleteSecond(this.id);
}

class ReturnAndModifySecond extends FirstEvent{
  final ItemComments item;

  ReturnAndModifySecond(this.item);
}