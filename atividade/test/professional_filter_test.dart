import 'package:flutter_test/flutter_test.dart';
import '../lib/models/professional.dart';

void main() {
  test('Filtrar profissionais por avaliação mínima', () {
    final professionals = [
      Professional(id: 1, name: 'Luis', rating: 3.4, pricePerHour: 25),
      Professional(id: 2, name: 'Ana', rating: 4.5, pricePerHour: 30),
      Professional(id: 3, name: 'João', rating: 4.0, pricePerHour: 20),
    ];

    final filteredProfessionals = professionals.where((p) => p.rating >= 4.0).toList();

    expect(filteredProfessionals.length, 2);
    expect(filteredProfessionals[0].name, 'Ana');
    expect(filteredProfessionals[1].name, 'João');
  });
}