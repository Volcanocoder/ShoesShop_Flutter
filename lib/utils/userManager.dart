import 'package:shoesShop/models/base_models.dart';

class UserManager {
  static userModel? currentUser;

  static void setCurrentUser(userModel user) {
    currentUser = user;
  }

  static userModel? getCurrentUser() {
    return currentUser;
  }
}
