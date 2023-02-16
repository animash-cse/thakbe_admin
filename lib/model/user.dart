class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String password;
  late String device_token;
  late String address;
  late String image_url;
  late String badge_name;
  late int badge_id;
  late int trust;
  late String trust_range;
  late String blood_group;
  late int social_work;
  late int money;
  late int waiting_money;
  late int district_id;
  late String email_verified_at;
  late String remember_token;
  late String created_at;
  late String updated_at;
  late String msg;
  
  toJson() {
    return {
      'id': id.toString(),
      'name': name.toString(),
      'address': address.toString(),
      'image_url': image_url.toString(),
      'msg': msg.toString(),
      'device_token': device_token,
      'email': email,
      'phone': phone.toString(),
      'password': password,
    };
  }
}
