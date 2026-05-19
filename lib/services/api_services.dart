import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/kategori_model.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  static Future<List<Kategori>> getKategori() async {
    final response = await http.get(Uri.parse('$baseUrl/kategori'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Kategori.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil kategori');
    }
  }
}
