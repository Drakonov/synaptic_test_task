import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:synaptic_test_task/first/model/item_comments.dart';

import 'model/item_post.dart';

part 'second_event.dart';

part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  ItemPost _post;

  SecondBloc(SecondState initialState) : super(SecondInitial());

  @override
  Stream<SecondState> mapEventToState(
    SecondEvent event,
  ) async* {
    if (event is LoadSecond) {
      yield SecondInitial();
      _post = await _fetch(event.id);
      yield SecondLoaded(_post);
    }
    if (event is DeleteRecordSecond){
      yield SecondInitial();
      _post = await _delete(event.id);
      yield SecondDeleted();
    }
    if (event is ModifyRecordSecond){
      yield SecondInitial();
      _post = await _modify(event.item,event.id,event.title,event.body);
      yield SecondDeleted();
    }
  }
  Future<ItemPost> _fetch(_id) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$_id';
    var _response = await http.get(url);
    return (itemPostFromJson(_response.body));
  }
  Future<ItemPost> _modify(ItemPost itemPost,String id,String title,String body,) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/${itemPost.id}';
    itemPost.title = title;
    itemPost.body = body;
    var _response = await http.put(url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: itemPostToJson(itemPost));
    print(_response.body);
    return (itemPostFromJson(_response.body));
  }
  Future<ItemPost> _delete(_id) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$_id';
    var _response = await http.delete(url);
    return (itemPostFromJson(_response.body));
  }
}
