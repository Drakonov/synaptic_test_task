part of 'first_bloc.dart';

@immutable
abstract class FirstEvent {}

class InitialFirst extends FirstEvent{}

class AddFirst extends FirstEvent{}

class ReturnAndDeleteFirst extends FirstEvent{
  final int id;

  ReturnAndDeleteFirst(this.id);
}

class ReturnAndModifyFirst extends FirstEvent{
  final String id;
  final String title;
  final String body;

  ReturnAndModifyFirst(this.id, this.title, this.body);
}