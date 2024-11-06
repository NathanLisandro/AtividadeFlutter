// services/professional_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/professional.dart';

class ProfessionalService {
  final String _baseUrl = 'http://localhost:3000/professionals';

  Future<List<Professional>> fetchProfessionals() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Professional.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar profissionais');
    }
  }
}
