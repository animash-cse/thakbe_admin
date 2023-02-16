import 'package:thakbe_admin/model/user.dart';
import 'package:thakbe_admin/repository/repository.dart';

class UserService {
  final Repository _repository = new Repository();


  httpGetUser(String phone) async {
    return await _repository.httpGetUser('users/'+ phone);
  }

  sendSMS(User user) async {
    return await _repository.httpPost('advertise', user.toJson());
  }


  // Update users name, address, Blood,
  httpUpdateUserData(String token, User data, int id) async {
    return await _repository.httpUpdateUserData('users/update/'+id.toString(), token, data.toJson());
  }

  // Update Profile Phoro
  httpUpdateUserPhoto(String token, User data, int id) async {
    return await _repository.httpUpdateUserProfile('users/update_profile/'+id.toString(), token, data.toJson());
  }

  httpGetUserById(int id) async {
    return await _repository.httpGetUserById('users/view/'+id.toString());
  }
  createUser(User user) async {
    return await _repository.httpRegistration('users/register', user.toJson());
  }

  login(User user) async {
    return await _repository.httpLogin('users/login', user.toJson());
  }
}