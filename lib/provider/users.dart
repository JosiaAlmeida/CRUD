import 'package:flutter/widgets.dart';
import 'package:sistemadecadastro/data/user.dart';
import 'package:sistemadecadastro/models/user.dart';

class UserProvider with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }
}