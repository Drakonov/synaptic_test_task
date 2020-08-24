part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {}

class InitialSecond extends SecondEvent{}

class LoadSecond extends SecondEvent{
  final int id;

  LoadSecond(this.id);
}

class DeleteRecordSecond extends SecondEvent{
  final int id;

  DeleteRecordSecond(this.id);
}

class ModifyRecordSecond extends SecondEvent{
  final ItemPost item;

  ModifyRecordSecond(this.item);
}


