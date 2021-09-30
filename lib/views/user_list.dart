import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistemadecadastro/components/user_tile.dart';
import 'package:sistemadecadastro/data/user.dart';
import 'package:sistemadecadastro/models/user.dart';
import 'package:sistemadecadastro/provider/users.dart';
import 'package:sistemadecadastro/routes/app_routes.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider
    final UserProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView All Users"),
        actions: <Widget>[
          IconButton(onPressed: (){
            //users.put(User(name: 'Almeida', avatarUrl: '', email: 'Almeida@gmail.com'));
            Navigator.pushNamed(context, AppRoutes.USER_FORM);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, i) => UserTile(users.all.elementAt(i)),
        ),
    );
  }
}
