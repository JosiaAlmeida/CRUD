import 'package:flutter/material.dart';
import 'package:sistemadecadastro/components/user_tile.dart';
import 'package:sistemadecadastro/data/user.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Usuarios"),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i) => UserTile(users.values.elementAt(i)),
        ),
    );
  }
}
