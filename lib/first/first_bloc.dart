import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'model/item_comments.dart';

part 'first_event.dart';

part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  int _counterDeletedRow = 0;
  List<ItemComments> items = [];
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
    if (event is ReturnAndDeleteSecond){
      yield FirstInitial();
      items.removeAt(-1+event.id+_counterDeletedRow);
      _counterDeletedRow--;
      print(-1+event.id);
      yield FirstReturned(items);
    }
  }

  Future _fetch(_page) async {
    var url = 'https://jsonplaceholder.typicode.com/comments/$_page';
    var _response = await http.get(url);
    //print('Request  status: ${_response.statusCode}.');
    //print('Request  body: ${_response.body}.');
    if (_response.statusCode == 200) {
      final _itemUser = itemCommentsFromJson(_response.body);
      items.add(_itemUser);
    } else {
      print('Request failed with status: ${_response.statusCode}.');
    }
  }
}
