import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchGet(String url) async {
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':
          'Bearer ya29.a0ARrdaM-QJ3P9sL_CUkxiMPP6UFkJx9UtKttPemrVNom44hfzuujeZEi7Uaiix2yjQE_-VJUTpsAQhXp8Y01Vr15ocEva2OhSLL12zfC0MzTrSuW8HcsEFuPw54XSev3dJXgFkhDm22DgpeiIs3rPEX_dPEaR'
    },
  );

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return utf8.decode(response.bodyBytes);
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}
