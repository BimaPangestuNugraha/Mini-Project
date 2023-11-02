import 'package:flutter/foundation.dart';
import 'package:resep_koki/Models/ChefContact.dart';

class ChefProvider with ChangeNotifier {
  List<ChefContact> _chefContacts = [
    ChefContact(name: 'Chef Juna', phoneNumber: '1234567891012'),
    ChefContact(name: 'Chef Renata', phoneNumber: '1234567891012'),
    ChefContact(name: 'Chef Arnold', phoneNumber: '1234567891012'),
  ];

  List<ChefContact> get chefContacts => _chefContacts;

  void addChefContact(ChefContact contact) {
    _chefContacts.add(contact);
    notifyListeners();
  }
}
