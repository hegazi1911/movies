
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headrs = {};
    if (token != null) {
      headrs.addAll({"Authorization": "Bearer $token"});
    }
    try{
    http.Response response = await http.get(Uri.parse(url), headers: headrs);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception("there is a proplem whith status code ${response.body}");
    }}catch (e) {

      const Text("check your internet" );
    }

  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headrs = {};
    if (token != null) {
      headrs.addAll({"Authorization": "Bearer $token"});
    }
    http.Response respons = await http.post(
      Uri.parse(url),
      body: body,
      headers: headrs,
    );
    if (respons.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respons.body);
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${respons.statusCode} with body${jsonDecode(respons.body)}}");
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headrs = {};
    headrs.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headrs.addAll({"Authorization": "Bearer $token"});
    }
    print('url = $url body = $body token=$token');
    http.Response respons = await http.put(
      Uri.parse(url),
      body: body,
      headers: headrs,
    );
    if (respons.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(respons.body);
      print(data);
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${respons.statusCode} with body${jsonDecode(respons.body)}}");
    }
  }
}
