import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistemadecadastro/models/user.dart';
import 'package:sistemadecadastro/provider/users.dart';

class UserForm extends StatefulWidget {
  UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

final _form = GlobalKey<FormState>();
final Map<String, String> formData = {};

class _UserFormState extends State<UserForm> {
  void _loadFormData(User? user) {
    if (user != null) {
      formData['id'] = user!.id;
      formData['name'] = user.name;
      formData['email'] = user.email;
      formData['avatarUrl'] = user.avatarUrl;
    }
  }
  void cleanDataForm(){
      formData['id'] = '';
      formData['name'] = '';
      formData['email'] = '';
      formData['avatarUrl'] ='';
  }
  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)!.settings.arguments as User?;

    _loadFormData(user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Items"),
        actions: [
          IconButton(
            onPressed: () {
              final bool isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState?.save();
                UserProvider user = Provider.of(context, listen: false);

                user.put(User(
                  id: formData['id'].toString(),
                  avatarUrl: formData['avatarUrl'].toString(),
                  name: formData['name'].toString(),
                  email: formData['email'].toString(),
                ));
                cleanDataForm();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome Vazio';
                    }
                    if (value.trim().length < 3) {
                      return 'Nome muito pequeno';
                    }
                  },
                  onSaved: (value) => formData['name'] = value.toString(),
                ),
                TextFormField(
                  initialValue: formData['email'],
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onSaved: (value) => formData['email'] = value.toString(),
                ),
                TextFormField(
                  initialValue: formData['avatarUrl'],
                  decoration: InputDecoration(labelText: 'Avatar'),
                  onSaved: (value) => formData['avatarUrl'] = value.toString(),
                ),
              ],
            )),
      ),
    );
  }
}
