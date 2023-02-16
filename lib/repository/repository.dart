import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {

// ----------------Change _baseUrl in databasehelpher----------------
  //String _baseUrl = 'http://127.0.0.1:8000/api';
  String _baseUrl = 'https://thakbe.com/api/admins';

  //String _baseUrl = 'http://192.168.0.6:8000/api';

  //String _baseUrl = 'http://192.168.240.167:8000/api';
  var headers = {
    //'content-type': "application/json"
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


  httpGet(String api) async {
    return await http.get(Uri.parse(_baseUrl + "/" + api), headers: headers);
  }

  httpGetUserProduct(String api, token) async {
    return await http.get(Uri.parse(_baseUrl + "/" + api), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },);
  }

  httpDelete(String api, token) async {
    return await http.delete(
      Uri.parse(_baseUrl + "/" + api),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }

  httpDeactivate(String api, token) async {
    return await http.patch(
      Uri.parse(_baseUrl + "/" + api),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }

  httpGetById(String api, id) async {
    return await http.get(Uri.parse(_baseUrl + "/" + api + "/" + id.toString()),
        headers: headers);
  }

  httpPost(String api, data) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api),
        headers: headers, body: json.encode(data));
  }

  httpDeliveryCost(String api, data) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api), body: {
      'total_amount': data.toString(),
    });
  }

  httpLogin(String api, data) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api), body: {
      'phone': data['phone'],
      'password': data['password'],
      'device_token': data['device_token']
    });
  }

  httpRegistration(String api, data) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api),
        headers: headers,
        body: json.encode({
          'name': data['name'],
          'phone': data['phone'],
          'password': data['password'],
          'device_token': data['device_token']
        }));
  }

  httpGetUser(String api) async {
    return await http.get(Uri.parse(_baseUrl + "/" + api), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }

  httpGetUserById(String api) async {
    return await http.get(Uri.parse(_baseUrl + "/" + api), headers: headers);
  }

  // Update user name, address
  httpUpdateUserData(String api, token, data) async {
    return await http.patch(Uri.parse(_baseUrl + "/" + api), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'token': token,
      'name': data['name'],
      'address': data['address'],
      'image_url': data['image_url']
    });
  }

  // Update Profile Photo
  httpUpdateUserProfile(String api, token, data) async {
    return await http.patch(Uri.parse(_baseUrl + "/" + api), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'image_url': data['image_url']
    });
  }

  //var url = Uri.parse("http://192.168.0.12:8000/api/upload_products");
  httpUploadProduct(String api, data, token) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          'name': data['name'],
          'short_desc': data['short_desc'],
          'long_desc': data['long_desc'],
          'phone': data['phone'],
          'address': data['address'],
          'price': data['price'],
          'discount_price': data['discount_price'],
          'photo': data['photo'],
          //'photo_thumb': data['photo_thumb'],
          'stock': data['stock'],
          'is_order': data['is_order'],
          'category_id': data['category_id'],
          'sub_category_id': data['sub_category_id'],
          'user_id': data['user_id'],
          'district_id': data['district_id']
        }));
  }

  httpUpdateProduct(String api, data, token) async {
    return await http.patch(Uri.parse(_baseUrl + "/" + api),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          'name': data['name'],
          'short_desc': data['short_desc'],
          'long_desc': data['long_desc'],
          'address': data['address'],
          'price': data['price'],
          'discount_price': data['discount_price'],
          'photo': data['photo'],
          'stock': data['stock'],
          'is_order': data['is_order'],
          'category_id': data['category_id'],
          'sub_category_id': data['sub_category_id'],
          'user_id': data['user_id'],
        }));
  }

  //var url = Uri.parse("http://192.168.0.12:8000/api/upload_products");
  httpUploadSlider(String api, data) async {
    return await http.post(Uri.parse(_baseUrl + "/" + api),
        headers: headers,
        body: json.encode({
          'title': data['title'],
          'image_url': data['image_url'],
          'user_id': data['user_id'],
          'district_id': data['district_id']
        }));
  }
}