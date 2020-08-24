import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'first/first_bloc.dart';
import 'second/second_bloc.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(child:
            BlocBuilder<SecondBloc, SecondState>(builder: (context, state) {
              if (state is SecondInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SecondLoaded) {
                return _info(context, state);
              }
              if (state is SecondDeleted) {
                return Center(
                  child: Text(
                    'Row success deleted',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [],
      ),
    );
  }


  _info(context, state) {
    final FirstBloc _firstBloc = BlocProvider.of<FirstBloc>(context);
    final SecondBloc _secondBloc = BlocProvider.of<SecondBloc>(context);
    final TextEditingController _controllerId = TextEditingController();
    _controllerId.text = state.item.id.toString();
    final TextEditingController _controllerTitle = TextEditingController();
    _controllerTitle.text = state.item.title.toString();
    final TextEditingController _controllerBody = TextEditingController();
    _controllerBody.text = state.item.body.toString();
    return Column(
      children: <Widget>[
        Text(
          'Идентификатор',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _controllerId,
        ),
        Text(
          'Заголовок ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _controllerTitle,
          minLines: 2,
          maxLines: 10,
        ),
        Text(
          'Сообщение ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: _controllerBody,
          minLines: 2,
          maxLines: 10,
        ),
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _secondBloc.add(DeleteRecordSecond(state.item.id));
            _firstBloc.add(ReturnFromSecond(state.item.id));
            Navigator.pop(context);
          },
          tooltip: 'Delete this record',
        )
      ],
    );
  }
}
