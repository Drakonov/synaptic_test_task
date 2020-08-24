import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'model/item_user.dart';

part 'first_event.dart';

part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  int _counterOfPage = 1;
  List<ItemUser> items = [];
  int _page = 0;

  FirstBloc(FirstState initialState) : super(FirstInitial());

  @override
  Stream<FirstState> mapEventToState(
    FirstEvent event,
  ) async* {
    if (event is InitialFirst) {
      yield FirstInitial();
      for (int _i = 1; _i < 10; _i++) {
        _page = _i;
        await _fetch(_page);
      }
      yield FirstLoaded(items);
    }
    if (event is AddFirst) {
      for (int _i = 1; _i < 5; _i++) {
        await _fetch(++_page);
      }
      yield FirstLoaded(items);
    }
    if (event is ReturnFromSecond){
      yield FirstInitial();
      for (int _i = 1; _i < 10; _i++) {
        _page = _i;
        if (state.item.id != _page)
        await _fetch(_page);
      }
      yield FirstLoaded(items);
    }
  }

  Future _fetch(_page) async {
    var url = 'https://jsonplaceholder.typicode.com/comments/$_page';
    var _response = await http.get(url);
    //print('Request  status: ${_response.statusCode}.');
    //print('Request  body: ${_response.body}.');
    if (_response.statusCode == 200) {
      final _itemUser = itemUserFromJson(_response.body);
      items.add(_itemUser);
    } else {
      print('Request failed with status: ${_response.statusCode}.');
    }
  }
}
