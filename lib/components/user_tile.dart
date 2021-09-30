import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sistemadecadastro/models/user.dart';
import 'package:sistemadecadastro/provider/users.dart';
import 'package:sistemadecadastro/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty ? CircleAvatar(
      child: Icon(Icons.person),
    ): CircleAvatar(
      backgroundImage: NetworkImage(user.avatarUrl),
    );
    final UserProvider users = Provider.of(context);
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: () {
                Navigator.pushNamed(context, AppRoutes.USER_FORM, arguments: user);
              }, icon: Icon(Icons.edit, color: Colors.red,)),
              IconButton(onPressed: () {
                users.remove(user.id);
              }, icon: Icon(Icons.delete, color: Colors.red))
            ],
          ),
        ));
  }
}
