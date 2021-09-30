import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:sistemadecadastro/data/user.dart';
import 'package:sistemadecadastro/models/user.dart';

class UserProvider with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    //Verificando se id existe
    if (_items.containsKey(user.id) &&
        user.id != null &&
        user.id.trim().isNotEmpty) {
      //Atualizando
      _items.update(
          user.id,
          (_) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl));
    } else {
      //Adicionando
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () =>
              User(id: id, name: user.name, email: user.email, avatarUrl: ''));
    }
    notifyListeners();
  }

  void remove(String id){
    if(id !=null ){
      _items.remove(id);
      notifyListeners();
    }
  }
}
