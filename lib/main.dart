import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistemadecadastro/provider/users.dart';
import 'package:sistemadecadastro/routes/app_routes.dart';
import 'package:sistemadecadastro/views/user_form.dart';
import 'package:sistemadecadastro/views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.HOME,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_)=> UserList(),
          AppRoutes.USER_FORM:(_) => UserForm(),
        },
      ),
    );
  }
}
